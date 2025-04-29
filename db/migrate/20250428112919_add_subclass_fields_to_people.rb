class AddSubclassFieldsToPeople < ActiveRecord::Migration[8.0]
  def change
    change_table :people, bulk: true do |t|
      t.references :class_cohort, foreign_key: true
      t.date       :enrollment_date

      t.date  :employment_commencement_date
      t.float :salary

      t.references :student,
                   foreign_key: { to_table: :people }
    end
  end
end
