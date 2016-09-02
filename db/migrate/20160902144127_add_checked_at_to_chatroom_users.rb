class AddCheckedAtToChatroomUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :chatroom_users, :checked_at, :datetime
  end
end
