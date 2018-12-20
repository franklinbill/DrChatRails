require 'test_helper'
class FriendshipStateTest < ActionDispatch::IntegrationTest
  test "test show information of friend" do
    get "/users/9"
    get "/users/1"
    assert_response :redirect
    follow_redirect!
  end

  test "delete a friend" do
    get "/chats"
    delete "/friendships/3"
    assert_response :redirect
    follow_redirect!
  end

end