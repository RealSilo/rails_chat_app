class AddDirectChatroomToChatrooms < ActiveRecord::Migration[5.0]
  def change
    add_column :chatrooms, :direct_chatroom, :boolean, default: false
  end
end
