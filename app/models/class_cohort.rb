class ClassCohort < ApplicationRecord
  belongs_to :grade,          class_name: "ClassGrade"
  belongs_to :class_teacher,  class_name: "Teacher"

  has_many   :students,
             class_name:  "Student",
             dependent:   :nullify

  has_many :subjects, dependent: :destroy
end
