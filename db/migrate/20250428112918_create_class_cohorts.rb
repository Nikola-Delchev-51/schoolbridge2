class CreateClassCohorts < ActiveRecord::Migration[8.0]
  def change
    create_table :class_cohorts do |t|
      t.string :name, null: false
      t.references :class_teacher, null: false, foreign_key: { to_table: :people }
      t.references :grade, null: false, foreign_key: { to_table: :class_grades }

      t.timestamps
    end
  end
end
