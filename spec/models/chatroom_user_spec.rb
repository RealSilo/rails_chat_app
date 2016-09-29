require 'rails_helper'

RSpec.describe ChatroomUser, type: :model do
  describe "model validations" do

    it "has a valid factory" do
      expect(build_stubbed(:chatroom_user)).to be_valid
    end

    it "is not valid without user" do
      expect(build_stubbed(:chatroom_user, chatroom: nil)).not_to be_valid
    end

    it "is not valid without chatroom" do
      expect(build_stubbed(:chatroom_user, user: nil)).not_to be_valid
    end

    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.to validate_presence_of(:chatroom) }
  end

  describe "associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:chatroom) }
  end

  describe "instance methods" do
    let(:chatroom) { build_stubbed(:chatroom) }
    let(:user) { build_stubbed(:user) }
    let(:chatroom_user) { build_stubbed(:chatroom_user, checked_at: nil) }

    it "sets checked at" do
      chatroom_user.set_last_checked
      expect(chatroom_user.checked_at).to_not eq(nil)
    end
  end
end