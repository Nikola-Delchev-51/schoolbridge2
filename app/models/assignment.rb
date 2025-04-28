class Assignment < ApplicationRecord
  belongs_to :subject
  belongs_to :class_grade

  has_many   :assignment_submissions,
             dependent: :destroy
  delegate :teacher, to: :subject
end
