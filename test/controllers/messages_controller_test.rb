require 'test_helper'
include SessionsHelper

class MessagesControllerTest < ActionController::TestCase
  setup do
    @message = messages(:one)
  end

  # test "should create message" do
  #   assert_difference('Message.count') do
  #     post :create, message: { body: "hello", id: 1, chat_room: 1 }
  #   end
  #
  #   assert_redirected_to root_path
  # end

  # test "should destroy message" do
  #   assert_difference('Message.count', 0) do
  #     delete :destroy, params:{ id: 1, chat_room: }
  #   end
  #
  #   assert_redirected_to root_path
  # end
end
