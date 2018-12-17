class CreateReadFlags < ActiveRecord::Migration
  def change
    create_table :read_flags do |t|
      t.boolean :flag
      t.integer :user_id
      t.integer :message_id

      t.timestamps null: false
    end
  end
end
