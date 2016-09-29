require 'rails_helper'

RSpec.describe Chatroom, type: :model do
  describe "model validations" do
    subject { FactoryGirl.build(:chatroom) }

    it "has a valid factory" do
      expect(build_stubbed(:chatroom)).to be_valid
    end

    it "is not valid without user" do
      expect(build_stubbed(:chatroom, owner: nil)).not_to be_valid
    end

    it "is not valid without name" do
      expect(build_stubbed(:chatroom, name: nil)).not_to be_valid
    end

    it { is_expected.to validate_presence_of(:owner) }
    it { is_expected.to validate_presence_of(:name).with_message(/can't be blank/) }
    it { is_expected.to validate_length_of(:name).is_at_least(4).is_at_most(64).with_message(/must be between 4 and 64 characters/) }
    it { is_expected.to validate_uniqueness_of(:name).with_message(/already exists/) }
  end

  describe "associations" do
    it { is_expected.to have_many(:messages).dependent(:destroy) }
    it { is_expected.to have_many(:chatroom_users).dependent(:destroy) }
    it { is_expected.to have_many(:users).through(:chatroom_users) }
    it { is_expected.to belong_to(:owner).class_name('User').with_foreign_key('user_id') }
  end

  describe "scopes" do
    let(:public_chatroom) { create(:chatroom) }
    let(:private_chatroom) { create(:chatroom, private_chatroom: true, name: "private_chatroom_1_2") }

    it "returns public_chatrooms" do
      expect(Chatroom.public_chatrooms).to include(public_chatroom)
      expect(Chatroom.public_chatrooms).not_to include(private_chatroom)
    end

    it "returns private_chatrooms" do
      expect(Chatroom.private_chatrooms).not_to include(public_chatroom)
      expect(Chatroom.private_chatrooms).to include(private_chatroom)
    end    
  end

  describe "instance methods" do
    let(:owner) { create(:user, username: "John Smith") }
    let(:chatroom) {create(:chatroom, owner: owner) }

    it "returns owner_name" do
      expect(chatroom.owner_name).to eq("John Smith")
    end
  end

  describe "class methods" do
    describe "self.private_chatroom_for_users" do
      let(:user) { create(:user) }
      let(:other_user) { create(:user) }
      let!(:another_user) { create(:user) }
      let!(:private_chatroom) {create(:chatroom, private_chatroom: true, owner: user, name: "private_chatroom_#{user.id}_#{other_user.id}")}

      it "returns private chatroom for users if already exists" do
        users = [user, other_user]
        expect(Chatroom.private_chatroom_for_users(users)).to eq(private_chatroom)
      end

      it "returns private chatroom for users if doesn't exist yet" do
        users = [user, another_user]
        expect { Chatroom.private_chatroom_for_users(users) }.to change{ Chatroom.count }.by(1)
      end
    end
  end
end