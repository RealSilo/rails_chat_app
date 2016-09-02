class MessageRelayJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast("chatrooms:#{message.chatroom_id}", {
      body: message.body,
      username: message.username,
      created_at: message.created_at,
      chatroom_id: message.chatroom_id
    })
  end
end
