class Subject < ApplicationRecord
  belongs_to :class_cohort
  belongs_to :teacher, class_name: "Teacher"
  has_many   :assignments, dependent: :destroy
end
