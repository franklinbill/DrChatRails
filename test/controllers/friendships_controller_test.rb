require 'test_helper'

class FriendshipsControllerTest < ActionController::TestCase
  setup do
    @friendship = friendships(:one)
  end

  # test "should create friendship" do
  #   assert_difference('Friendship.count',0) do
  #     post :create, friendship: { friend_id: "1" }
  #   end
  #
  #   assert_redirected_to root_path
  # end
  #
  # test "should destroy friendship" do
  #   assert_difference('Friendship.count', 0) do
  #     delete :destroy, id: @friendship
  #   end
  #
  #   assert_redirected_to root_path
  # end
end
