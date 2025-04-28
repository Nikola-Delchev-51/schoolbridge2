class AssignmentSubmission < ApplicationRecord
  belongs_to :student
  belongs_to :assignment

  has_one    :plagiarism_report, dependent: :destroy
  has_one_attached :file
end
