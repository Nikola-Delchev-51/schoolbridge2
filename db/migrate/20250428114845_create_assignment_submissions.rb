class CreateAssignmentSubmissions < ActiveRecord::Migration[8.0]
  def change
    create_table :assignment_submissions do |t|
      t.references :student, null: false, foreign_key: { to_table: :people }
      t.references :assignment, null: false, foreign_key: true
      t.integer :attempt_number, null: false, default: 1
      t.date :date_submitted, null: false
      t.float :grade
      t.text :feedback

      t.timestamps
    end
  end
end
