class AddColumnPriorityToChatsUsers < ActiveRecord::Migration
  def up
    add_column :chats_users, :priority, :integer
  end
end
