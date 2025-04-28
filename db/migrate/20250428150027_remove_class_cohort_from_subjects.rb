class RemoveClassCohortFromSubjects < ActiveRecord::Migration[8.0]
  class RemoveClassCohortFromSubjects < ActiveRecord::Migration[8.0]
    def change
      remove_reference :subjects,
                       :class_cohort,
                       foreign_key: true
    end
  end
end
