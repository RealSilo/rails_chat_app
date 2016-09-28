class RenamingDirectChatroomInChatroom < ActiveRecord::Migration[5.0]
  def up
    rename_column :chatrooms, :direct_chatroom, :private_chatroom
  end

  def down
    rename_column :chatrooms, :private_chatroom, :direct_chatroom
  end
end
