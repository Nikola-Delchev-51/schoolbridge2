class CreateClassGrades < ActiveRecord::Migration[8.0]
  def change
    create_table :class_grades do |t|
      t.integer :grade, null: false
      t.integer :enrollment_year, null: false

      t.timestamps
    end
  end
end
