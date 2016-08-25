class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user

  delegate :username, to: :user
end
