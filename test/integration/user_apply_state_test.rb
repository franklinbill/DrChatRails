require 'test_helper'

class UserApplyStateTest < ActionDispatch::IntegrationTest
  test "user add apply" do
    post "/friendships?friend_id=5"
    assert_response :redirect
    follow_redirect!
  end

  test "user add apply recall" do
    get "/chats"
    delete "/friendships/2"
    assert_response :redirect
    follow_redirect!
  end

  test "user apply agree" do
    get "/chats"
    post "/friendships/2"
    assert_response :redirect
    follow_redirect!
  end

  test "user add apply refuse" do
    get "/chats"
    delete "/friendships/1"
    assert_response :redirect
    follow_redirect!
  end


end