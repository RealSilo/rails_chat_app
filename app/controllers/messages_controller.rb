class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chatroom

  ##controller action is not necessary as message creation is invoked in chatrooms_channel.rb
  # def create
  #   message = @chatroom.messages.new(message_params)
  #   message.user = current_user
  #   message.save
  #   MessageRelayJob.perform_later(message)
  # end

  private

  def set_chatroom
    @chatroom = Chatroom.find(params[:chatroom_id])
  end

  def message_params
    params.require(:message).permit(:body)
  end
end