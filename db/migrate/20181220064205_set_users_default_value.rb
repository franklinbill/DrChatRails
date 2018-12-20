class SetUsersDefaultValue < ActiveRecord::Migration
  def change
    change_column_default :users, :role, 1
    change_column_default :users, :sex, "secret"
    change_column_default :users, :phonenumber, ""
    change_column_default :users, :status, "user"
  end
end
