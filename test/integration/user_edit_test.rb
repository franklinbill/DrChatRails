require 'test_helper'
class UserEditTest < ActionDispatch::IntegrationTest
  test "test user edit information" do
    get "/users/1"
    patch "/users/1",{user:{name:"user1",
                            email:"user1@test.com",
                            password:"password",
                            phonenumber:"123456677777",
                            sex:"male"}}
    assert_response :redirect
    follow_redirect!
  end
end