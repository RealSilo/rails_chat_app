class Chatroom < ApplicationRecord
  has_many :chatroom_users, dependent: :destroy
  has_many :users, through: :chatroom_users
  has_many :messages, dependent: :destroy
  belongs_to :owner, class_name: "User", foreign_key: "user_id"

  validates :name, presence: { messsage: "Name can't be blank" }, length: { in: 4..20, message: "must be between 4 and 20 characters" }, uniqueness: { message: "already exists" }

  def owner_name
    owner.username
  end
end
