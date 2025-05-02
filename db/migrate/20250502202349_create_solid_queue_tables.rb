class CreateSolidQueueTables < ActiveRecord::Migration[8.0]
  def up
    load Rails.root.join("db", "queue_schema.rb")
  end

  def down
    drop_table :solid_queue_processes
    drop_table :solid_queue_jobs
  end
end