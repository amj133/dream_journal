require 'rails_helper'

describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of(:user_name) }
    it { should validate_presence_of(:password) }
  end

  describe "relationships" do
    it { should have_many(:dreams) }
  end
end
