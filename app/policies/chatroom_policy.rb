class ChatroomPolicy < ApplicationPolicy
 
  def create?
    user.present?
  end

  def edit?
    update?
  end

  def update?
    user.present? && user == chatroom.owner
  end

  def destroy?
    user.present? && user == chatroom.owner
  end

  private

    def chatroom
      record
    end
end