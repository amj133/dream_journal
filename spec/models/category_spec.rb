require 'rails_helper'

describe Category, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
  end

  describe "relationships" do
    it { should have_many(:dreams).through(:dream_categories) }
  end
end
