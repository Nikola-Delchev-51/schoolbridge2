# app/jobs/plagiarism_check_job.rb
class PlagiarismCheckJob < ApplicationJob
  queue_as :default

  # Ensure the Copyleaks SDK is loaded
  require 'copyleaks'
  require 'base64'

  def perform(submission_id)
    # Find the assignment submission and its attached file
    submission = AssignmentSubmission.find(submission_id)
    return unless submission.file.attached?

    # **1. Authenticate with Copyleaks API**
    copyleaks = Copyleaks::API.new
    # Use credentials from env or Rails credentials
    email    = ENV['COPYLEAKS_EMAIL']    || Rails.application.credentials.dig(:copyleaks, :email)
    api_key  = ENV['COPYLEAKS_API_KEY']  || Rails.application.credentials.dig(:copyleaks, :api_key)
    auth_token = copyleaks.login(email, api_key)
    # (auth_token contains the access token on successful login)

    # **2. Prepare file content for scanning**
    # Download the attached file and encode it to Base64
    file_blob   = submission.file.download
    base64_file = Base64.strict_encode64(file_blob)
    filename    = submission.file.filename.to_s

    # **3. Configure submission properties (webhooks, etc.)**
    # Generate a unique scan ID for this submission (can use submission.id or timestamp)
    scan_id = "submission-#{submission.id}-#{Time.now.to_i}"
    # Webhook URL that Copyleaks will call when scan status changes (e.g., completed)
    # Replace 'your-domain.com' with your actual domain or localhost tunnel
    host         = ENV.fetch("PUBLIC_HOST")
    webhook_url  = "#{host}/copyleaks/webhook/scan/#{scan_id}/{STATUS}"


    # Build the submission model with file content and properties
    submission_model = Copyleaks::CopyleaksFileSubmissionModel.new(
      base64_file,         # Base64 content of the file
      filename,            # Original filename (for report context)
      Copyleaks::SubmissionProperties.new(
        Copyleaks::SubmissionWebhooks.new(webhook_url),
        true,                        # Sandbox mode enabled (use false in production)
        submission.id.to_s,          # developerPayload: attach submission ID for verification
        false,                        # Allow including Copyleaks database scan
        60,                          # Scan results expiration (days)
        1,                           # Sensitivity level (1 is default)
        true,                        # Cheat detection enabled (detect potential cheating)
        Copyleaks::SubmissionActions::SCAN
      # (We use default settings for author, filters, scanning, etc. Additional options can be added if needed)
      )
    )

    # **4. Submit the file for plagiarism scan**
    copyleaks.submit_file(auth_token, scan_id, submission_model)
    # Copyleaks will process the file asynchronously. Once done, it will send a webhook to our app.

    # Note: We enabled `sandbox` mode above (`true`) for testing, which doesn’t consume credits and returns mock results.
    # In production, set sandbox to false to get real plagiarism results.
  end
end
