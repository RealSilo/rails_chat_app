class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user

  delegate :username, to: :user

  validates :chatroom_id, presence: true
  validates :user_id, presence: true
  validates :body, presence: true

  scope :latest, -> { order(created_at: :desc).limit(25).reverse }
end
