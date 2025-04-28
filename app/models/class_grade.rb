class ClassGrade < ApplicationRecord
  has_many :class_cohorts, dependent: :nullify
  has_many :subjects,      dependent: :nullify
  has_many :assignments,   dependent: :nullify
end
