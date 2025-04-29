class PlagiarismCheckJob < ApplicationJob
  queue_as :default

  # CopyLeaks SDK
  require 'copyleaks'
  require 'base64'

  def perform(submission_id)
    # Find the assignment submission and its attached file
    submission = AssignmentSubmission.find(submission_id)
    return unless submission.file.attached?

    # Authenticate with Copyleaks API
    copyleaks = Copyleaks::API.new
    # Use credentials from Rails credentials
    email    = ENV['COPYLEAKS_EMAIL']    || Rails.application.credentials.dig(:copyleaks, :email)
    api_key  = ENV['COPYLEAKS_API_KEY']  || Rails.application.credentials.dig(:copyleaks, :api_key)
    auth_token = copyleaks.login(email, api_key)

    # Download the attached file and encode it to Base64
    file_blob   = submission.file.download
    base64_file = Base64.strict_encode64(file_blob)
    filename    = submission.file.filename.to_s

    # Configure submission properties
    scan_id = "submission-#{submission.id}-#{Time.now.to_i}"
    host         = ENV.fetch("PUBLIC_HOST")
    webhook_url  = "#{host}/copyleaks/webhook/scan/#{scan_id}/{STATUS}"


    # Build the submission model with file content and properties
    submission_model = Copyleaks::CopyleaksFileSubmissionModel.new(
      base64_file,
      filename,
      Copyleaks::SubmissionProperties.new(
        Copyleaks::SubmissionWebhooks.new(webhook_url),
        true,
        submission.id.to_s,
        false,  # SANDBOX MODE!
        60,
        1,
        true,
        Copyleaks::SubmissionActions::SCAN
      )
    )

    # Submit the file for plagiarism scan
    copyleaks.submit_file(auth_token, scan_id, submission_model)
  end
end
