# app/models/student.rb
class Student < Person
  belongs_to :class_cohort
  has_many   :assignment_submissions
end
