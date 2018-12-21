require 'test_helper'

class ChatsControllerTest < ActionController::TestCase
  setup do
    @chat = chats(:one)
  end

  test "should create chat" do
    assert_difference('Chat.count',0) do
      post :create, chat: {name: "chat1", description:"user1&user2" }
    end

    assert_redirected_to root_path
  end

  test "should update chat" do
    patch :update, id: @chat, chat: {name: "chat1", description:"user1&user2"}
    assert_redirected_to root_path
  end

  test "should destroy chat" do
    assert_difference('Chat.count',  0) do
      delete :destroy, id: @chat
    end

    assert_redirected_to root_path
  end
end
