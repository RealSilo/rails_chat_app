class AddingOwnerToChatroom < ActiveRecord::Migration[5.0]
  def change
    add_reference :chatrooms, :user, index: true
    add_foreign_key :chatrooms, :users
  end
end
