class AddSubclassFieldsToPeople < ActiveRecord::Migration[8.0]
  def change
    change_table :people, bulk: true do |t|
      # Student
      t.references :class_cohort, foreign_key: true
      t.date       :enrollment_date

      # Teacher
      t.date  :employment_commencement_date
      t.float :salary

      # Parent → Student link (1-1)
      t.references :student,
                   foreign_key: { to_table: :people }
    end
  end
end
