class RemoveClassGradeIdFromSubjects < ActiveRecord::Migration[8.0]
  def change
    remove_column :subjects, :class_grade_id, :integer
  end
end
