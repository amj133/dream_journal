require 'rails_helper'

describe "user sees all dreams they posted" do
  describe "user visits their show page" do
    it "displays all dreams they have posted" do
      bob = User.create!(user_name: "BobRocks15",
                         email: "bobrocks@gmail.com")
      bob.dreams.create!()
    end
  end
end
