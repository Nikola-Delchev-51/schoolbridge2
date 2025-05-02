class CopyleaksController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:webhook]
  # Allow Copyleaks to call without authentication to the app
  skip_before_action :authenticate_person!, only: :webhook

  # POST /copyleaks/webhook/scan/:scan_id/:status
  def webhook
    scan_id = params[:scan_id]
    status  = params[:status]
    payload = request.raw_post

    # Parse JSON report
    data = JSON.parse(payload) rescue {}

    # Validate developerPayload points to a real submission
    if data["developerPayload"].present?
      sub_id = data["developerPayload"].to_s
      unless AssignmentSubmission.exists?(sub_id)
        Rails.logger.warn "Copyleaks webhook with invalid developerPayload=#{sub_id}"
        return head :bad_request
      end
    end

    # Only process completed scans
    if status == "completed"
      # Try overall match percentage
      similarity = data.dig("results", "score", "aggregatedScore").to_f

      # If zero, fall back to best per-source score
      if similarity.zero? && data["results"].is_a?(Hash)
        %w[internet database batch repositories].each do |category|
          Array(data["results"][category]).each do |res|
            pct = (res["percentage"] || res["score"] || 0).to_f
            similarity = pct if pct > similarity
          end
        end
      end

      # Gather source URLs
      sources = []
      if data["results"].is_a?(Hash)
        %w[internet database batch repositories].each do |category|
          Array(data["results"][category]).each do |res|
            sources << (res["url"] || res["title"])
          end
        end
      end

      # Upsert the report
      report = PlagiarismReport.find_or_initialize_by(
        assignment_submission_id: data["developerPayload"]
      )

      report.similarity_score = similarity
      report.sources_list     = sources.compact.uniq.join("\n")
      report.date_generated   = Date.current
      report.save!

      Rails.logger.info "PlagiarismReport ##{report.id} updated: #{similarity}%"
    end

    head :ok
  end
end
