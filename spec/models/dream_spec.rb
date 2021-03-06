require 'rails_helper'

describe Dream, type: :model do
  describe "validations" do
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:title) }
  end

  describe "relationships" do
    it { should belong_to(:user) }
    it { should have_many(:comments) }
    it { should have_many(:categories).through(:dream_categories) }
  end
end
