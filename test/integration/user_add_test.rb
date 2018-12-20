require 'test_helper'

class UserEddTest < ActionDispatch::IntegrationTest
  test "add new friend" do
    post "/friendships?friend_id=5"
    assert_response :redirect
    follow_redirect!
  end

  test "add new friend esc" do
    get "/chats"
    delete "/friendships/2"
    assert_response :redirect
    follow_redirect!
  end

end