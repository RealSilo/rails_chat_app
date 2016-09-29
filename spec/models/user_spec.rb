require 'rails_helper'

RSpec.describe User, type: :model do
  describe "associations" do
    it { is_expected.to have_many(:messages) }
    it { is_expected.to have_many(:chatroom_users) }
    it { is_expected.to have_many(:chatrooms).through(:chatroom_users) }
  end
end