class Subject < ApplicationRecord
  belongs_to :teacher, class_name: "Teacher"
  belongs_to :grade,   class_name: "ClassGrade"
  has_many   :assignments, dependent: :destroy
end
