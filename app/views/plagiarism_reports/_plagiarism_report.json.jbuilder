json.extract! plagiarism_report, :id, :assignment_submission_id, :similarity_score, :sources_list, :date_generated, :created_at, :updated_at
json.url plagiarism_report_url(plagiarism_report, format: :json)
