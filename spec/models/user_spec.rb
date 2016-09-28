require 'rails_helper'

RSpec.describe User, type: :model do
  describe "model validations" do


    it { is_expected.to have_many(:messages) }
    it { is_expected.to have_many(:chatrooms) }
  end
end