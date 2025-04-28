class Subject < ApplicationRecord
  belongs_to :teacher, class_name: "Teacher"
  belongs_to :class_grade
  has_many   :assignments, dependent: :destroy
end
