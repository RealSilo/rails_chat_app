class AddingUniqIndexToChatroomName < ActiveRecord::Migration[5.0]
  def up
    change_column_null :chatrooms, :name, false
    add_index :chatrooms, :name, unique: true
  end

  def down
    remove_index :chatrooms, :name, unique: true
    change_column_null :chatrooms, :name, true
  end
end
