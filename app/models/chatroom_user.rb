class ChatroomUser < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user

  before_create :set_last_checked

  validates :chatroom, presence: true
  validates :user, presence: true

  def set_last_checked
    self.checked_at = Time.zone.now
  end
end
