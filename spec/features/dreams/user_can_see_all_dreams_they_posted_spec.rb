require 'rails_helper'

describe "user sees all dreams they posted" do
  describe "user visits their show page" do
    it "displays all dreams they have posted" do
      bob = User.create!(user_name: "BobRocks15",
                         password: 'test',
                         email: "bobrocks@gmail.com")
      dream = bob.dreams.create!(title: "Escape From Jungle",
                                 body: "I was a worker on a jungle fortress, there was an overlord/slave driver with a whip, I escaped and flew away",
                                 analysis: "I love action/adventure and the feeling of flying")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(bob)

      visit user_path(bob)

      expect(page).to have_content("BobRocks15's Dream Journal")
      expect(page).to have_content(dream.title)
    end

    it "links to dream show page" do
      bob = User.create!(user_name: "BobRocks15",
                         password: 'test',
                         email: "bobrocks@gmail.com")
      dream = bob.dreams.create!(title: "Escape From Jungle",
                                 body: "I was a worker on a jungle fortress, there was an overlord/slave driver with a whip, I escaped and flew away",
                                 analysis: "I love action/adventure and the feeling of flying")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(bob)
      visit user_path(bob)
      click_link(dream.title)

      expect(current_path).to eq(dream_path(dream))
      expect(page).to have_content("BobRocks15 - Escape From Jungle")
      expect(page).to have_content(dream.body)
      expect(page).to have_content(dream.analysis)
    end
  end
end
