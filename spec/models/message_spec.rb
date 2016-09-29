require 'rails_helper'

RSpec.describe Message, type: :model do
  describe "model validations" do

    it "has a valid factory" do
      expect(build_stubbed(:message)).to be_valid
    end

    it "is not valid without user" do
      expect(build_stubbed(:message, user: nil)).not_to be_valid
    end

    it "is not valid without chatroom" do
      expect(build_stubbed(:message, chatroom: nil)).not_to be_valid
    end

    it "is not valid without body" do
      expect(build_stubbed(:message, body: nil)).not_to be_valid
    end

    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.to validate_presence_of(:chatroom) }
    it { is_expected.to validate_presence_of(:body) }
  end

  describe "associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:chatroom) }

    it { is_expected.to delegate_method(:username).to(:user) }
  end

  describe "scopes" do   
  end

  describe "instance methods" do
  end

  describe "class methods" do
  end
end