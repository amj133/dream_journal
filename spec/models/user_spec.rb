require 'rails_helper'

describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of(:user_name) }
    it { should validate_uniqueness_of(:user_name) }
  end

  describe "relationships" do
    it { should have_many(:dreams) }
  end

  describe "roles" do
    it "can be created as admin" do
      bob = User.create!(user_name: "bob",
                         password: "test",
                         role: 1)

      expect(bob.role).to eq("admin")
      expect(bob.admin?).to be_truthy
    end
  end
end
