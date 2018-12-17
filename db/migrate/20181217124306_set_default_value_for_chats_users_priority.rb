class SetDefaultValueForChatsUsersPriority < ActiveRecord::Migration
  def change
    change_column_default :chats_users, :priority, 0
  end
end
