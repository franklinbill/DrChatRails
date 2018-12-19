require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(name: "User1", email: "user1@test.com", password:"password")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = " "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = " "
    assert_not @user.valid?
  end

  test "password should be present" do
    @user.password = " "
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "user" * 51
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "user" * 250 + "@test.com"
    assert_not @user.valid?
  end

  test "password should not be too short" do
    @user.password = "12"
    assert_not @user.valid?
  end

end
