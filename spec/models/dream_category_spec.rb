require 'rails_helper'

describe DreamCategory, type: :model do
  describe "relationships" do
    it { should belong_to(:dream) }
    it { should belong_to(:category) }
  end
end
