require 'test_helper'
class MessagesSendTest < ActionDispatch::IntegrationTest
  test "message with invalid information" do
    post chats_path, {message: { body:"hello" }}
    assert_response :redirect
    follow_redirect!
  end
end