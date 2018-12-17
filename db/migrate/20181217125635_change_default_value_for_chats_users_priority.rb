class ChangeDefaultValueForChatsUsersPriority < ActiveRecord::Migration
  def change
    change_column_default :chats_users, :priority, 1
  end
end
