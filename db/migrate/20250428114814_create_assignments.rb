class CreateAssignments < ActiveRecord::Migration[8.0]
  def change
    create_table :assignments do |t|
      t.references :subject, null: false, foreign_key: true
      t.references :class_grade, null: false, foreign_key:  true
      t.date :date_due, null: false
      t.text :description

      t.timestamps
    end
  end
end
