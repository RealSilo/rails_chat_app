class PrivateChatroomsController < ApplicationController
  before_action :authenticate_user!

  def show
    users = [current_user, User.find(params[:id])]
    if users[0] == users[1]
      redirect_to :back, notice: "You can't crete a chatroom with yourself!"
    else
      @chatroom = Chatroom.private_chatroom_for_users(users)
      @messages = @chatroom.messages.latest
      @chatroom_user = current_user.chatroom_users.find_by(chatroom_id: @chatroom.id)
      render "chatrooms/show"
    end
  end
end