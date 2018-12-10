class CreateRobots < ActiveRecord::Migration
  def change
    create_table :robots do |t|
      t.integer :robot_id
      t.integer :response_times
      t.float :total_time
      t.integer :solve_times

      t.timestamps null: false
    end
  end
end
