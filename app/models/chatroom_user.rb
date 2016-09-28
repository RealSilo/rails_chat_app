class ChatroomUser < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user

  before_create :set_last_read

  def set_last_read
    self.checked_at = Time.zone.now
  end
end
