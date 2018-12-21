require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: {name:"user1",
                           email:"user1@test.com",
                           password:"password",
                           phonenumber:"123456677777",
                           sex:"male"}
    end

    assert_redirected_to root_path
  end

  test "should update user" do
    patch :update, id: @user, user: {name:"user1",
                                     email:"user1@test.com",
                                     password:"password",
                                     phonenumber:"123456677777",
                                     sex:"male"}
    assert_redirected_to root_path
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path(new: false)
  end
end
