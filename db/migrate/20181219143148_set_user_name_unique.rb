class SetUserNameUnique < ActiveRecord::Migration
  def change
    remove_index :users, :name
    add_index :users, :name, unique:true
  end
end
