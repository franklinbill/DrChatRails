class MessagesController < ApplicationController
  include SessionsHelper
  before_action :set_message, only: [:update, :destroy]

  def create
    @message = current_user.messages.build(message_params)
    chat=Chat.find_by_id(params[:chat_room])
    redirect_to chats_path, flash: {:warning => '此聊天不存在'} and return if chat.nil?
    @message.chat=chat
    
    if @message.save
      sync_new @message, scope: chat
      robot=User.find_by(role: 100)
      if chat.users.include?(robot)
        message_to_robot = {
          "reqType":0,
          "perception": {
            "inputText": {
                "text": message_params[:body]
            }
          },
          "userInfo": {
              "apiKey": "d1aa777c755e41618205648aeb1a94d7",
              "userId": "franklinbill"
          }
        }.to_json
        json = send_data("http://openapi.tuling123.com/openapi/api/v2", message_to_robot)
        response = JSON.parse(json)
        text = response["results"][0]["values"]["text"]
        robot_message=robot.messages.build({"body" => text})
        robot_message.chat=chat
        if robot_message.save
          sync_new robot_message, scope: chat
        end
      end
    else
      redirect_to chat_path(chat), flash: {:warning => '消息发送失败'} and return
    end
    redirect_to chat_path(chat)
  end

  def destroy
    @message = Message.find(params[:id])
    chat=Chat.find_by_id(params[:chat_room])
    @message.destroy
    sync_destroy @message
    redirect_to chat_path(chat)
  end

  def destroyall
    chat=Chat.find_by_id(params[:chat_room])
    chat.messages.delete_all
    redirect_to chat_path(chat), flash: {info: '聊天记录已清空'}
  end

  private
  def set_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:body)
  end

  def send_data(url, data)
    url = URI.parse(url)
    req = Net::HTTP::Post.new(url.path,{'Content-Type' => 'application/json'})
    req.body = data
    res = Net::HTTP.new(url.host,url.port).start{|http| http.request(req)}

    return res.body                                                                                                
  end
end

# def update
#   respond_to do |format|
#     if @message.update(message_params)
#       format.html { redirect_to @message, notice: 'Message was successfully updated.' }
#       format.json { render :show, status: :ok, location: @message }
#     else
#       format.html { render :edit }
#       format.json { render json: @message.errors, status: :unprocessable_entity }
#     end
#   end
# end
