json.extract! assignment_submission, :id, :student_id, :assignment_id, :attempt_number, :date_submitted, :grade, :feedback, :created_at, :updated_at
json.url assignment_submission_url(assignment_submission, format: :json)
