json.extract! subject, :id, :code, :name, :description, :grade_id, :class_cohort_id, :teacher_id, :created_at, :updated_at
json.url subject_url(subject, format: :json)
