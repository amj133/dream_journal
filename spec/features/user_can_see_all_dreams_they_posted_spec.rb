require 'rails_helper'

describe "user sees all dreams they posted" do
  describe "user visits their show page" do
    it "displays all dreams they have posted" do
      bob = User.create!(user_name: "BobRocks15",
                         email: "bobrocks@gmail.com")
      dream = bob.dreams.create!(title: "Escape From Jungle",
                                 body: "I was a worker on a jungle fortress, there was an overlord/slave driver with a whip, I escaped and flew away",
                                 analysis: "I love action/adventure and the feeling of flying")

      visit user_path(bob)

      expect(page).to have_content("BobRocks15's Dream Journal")
      expect(page).to have_content(dream.title)
    end
  end
end
