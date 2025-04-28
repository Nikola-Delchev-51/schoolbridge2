class CreateSubjects < ActiveRecord::Migration[8.0]
  def change
    create_table :subjects do |t|
      t.string :code, null: false
      t.string :name, null: false
      t.text :description
      t.references :class_grade, null: false, foreign_key: true
      t.references :class_cohort, null: true, foreign_key: true
      t.references :teacher, null: false, foreign_key: { to_table: :people }

      t.timestamps
    end
    add_index :subjects, :code, unique: true
  end
end
