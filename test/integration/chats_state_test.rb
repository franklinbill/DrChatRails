require 'test_helper'
class ChatsStateTest < ActionDispatch::IntegrationTest
  test "up state test of chat" do
    get "/chats/8"
    patch "/chats/8/set_priority?priority=up&user_id=1"
    assert_response :redirect
    follow_redirect!
  end

  test "reset state test of chat" do
    get "/chats/8"
    patch "/chats/8/set_priority?priority=reset&user_id=1"
    assert_response :redirect
    follow_redirect!
  end

  test "down state test of chat" do
    get "/chats/8"
    patch "/chats/8/set_priority?priority=down&user_id=1"
    assert_response :redirect
    follow_redirect!
  end

  test "delete chat" do
    get "/chats/8"
    delete "/chats/8"
    assert_response :redirect
    follow_redirect!
  end
end