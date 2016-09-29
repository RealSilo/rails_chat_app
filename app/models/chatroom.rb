class Chatroom < ApplicationRecord
  has_many :chatroom_users, dependent: :destroy
  has_many :users, through: :chatroom_users
  has_many :messages, dependent: :destroy
  belongs_to :owner, class_name: "User", foreign_key: "user_id"

  validates :owner, presence: true
  validates :name, presence: { message: "can't be blank" }, length: { in: 4..64, message: "must be between 4 and 64 characters" }, uniqueness: { message: "already exists" }

  scope :public_chatrooms, -> { where(private_chatroom: false) }
  scope :private_chatrooms, -> { where(private_chatroom: true) }

  def self.private_chatroom_for_users(users)
    user_ids = users.map(&:id).sort
    name = 'private_chatroom_' + user_ids.join("_")

    if chatroom = private_chatrooms.where(name: name).first
      chatroom
    else
      chatroom = new(name: name, private_chatroom: true)
      chatroom.user_id = users[0].id
      chatroom.users << users
      chatroom.save
      chatroom
    end
  end

  def owner_name
    owner.username
  end
end
