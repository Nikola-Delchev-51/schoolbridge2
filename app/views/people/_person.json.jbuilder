json.extract! person, :id, :username, :email, :forename, :middle_name, :surname, :type, :date_of_birth, :address_id, :class_cohort_id, :enrollment_date, :employment_commencement_date, :salary, :student_id, :created_at, :updated_at
json.url person_url(person, format: :json)
