class CreatePlagiarismReports < ActiveRecord::Migration[8.0]
  def change
    create_table :plagiarism_reports do |t|
      t.references :assignment_submission, null: false, foreign_key: true
      t.float :similarity_score
      t.text :sources_list
      t.date :date_generated

      t.timestamps
    end
  end
end
