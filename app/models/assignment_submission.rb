class AssignmentSubmission < ApplicationRecord
  belongs_to :student
  belongs_to :assignment

  has_one    :plagiarism_report, dependent: :destroy
  has_one_attached :file
  after_create_commit :queue_plagiarism_check

  private

  def queue_plagiarism_check
    PlagiarismCheckJob.perform_later(self.id)
  end
end
