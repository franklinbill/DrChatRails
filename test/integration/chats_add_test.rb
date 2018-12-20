require 'test_helper'
class ChatAddTest < ActionDispatch::IntegrationTest
  test "chat with invalid information" do
    post chats_path, {chat: { name:  "",
                              description: "user@invalid", }}
    assert_response :redirect
    follow_redirect!
  end
end