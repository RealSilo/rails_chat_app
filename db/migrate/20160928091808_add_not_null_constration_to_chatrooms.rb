class AddNotNullConstrationToChatrooms < ActiveRecord::Migration[5.0]
  def up
    change_column_null :chatrooms, :direct_chatroom, false
  end

  def down
    change_column_null :chatrooms, :direct_chatroom, true
  end
end
