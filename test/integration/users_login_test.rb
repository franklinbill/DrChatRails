require 'test_helper'
class UsersLoginTest < ActionDispatch::IntegrationTest


  test "login with invalid information" do
    post "/sessions/login", { session: { email: 'v@user.email',
                                         password: 'password' } }
    assert_not flash.empty?
  end

end