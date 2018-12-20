require 'test_helper'
class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    assert_no_difference 'User.count' do
      post users_path, {user: { name:  "",
                                email: "user@invalid",
                                password:  "password"}}
    end
  end

  test "signup" do
    post users_path, {user: { name:  "",
                              email: "user@invalid",
                              password:  "password"}}
    assert_response :redirect
    follow_redirect!
  end

  test "valid signup information" do
    assert_difference 'User.count', 1 do
      post users_path, { user: { name:  "user1",
                                 email: "user1@test.com",
                                 password:  "password"}}
    end
    follow_redirect!
    assert_template 'homes/home'
  end
end