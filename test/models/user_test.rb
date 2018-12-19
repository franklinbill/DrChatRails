require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(name: "User1", email: "user1@test.com")
  end
  test "name should be present" do
    @user.name = " "
    assert_not @user.valid?
  end
  test "email should be present" do
    @user.email = " "
    assert_not @user.valid?
  end
end
