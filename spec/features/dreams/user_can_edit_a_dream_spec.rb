require 'rails_helper'

describe "user can edit a dream" do
  describe "user visits dream show page" do
    it "has link to edit the dream" do
      bob = User.create!(user_name: "BobRocks15",
                         email: "bobrocks@gmail.com")
      dream = bob.dreams.create!(title: "Escape From Jungle",
                                 body: "I was a worker on a jungle fortress, there was an overlord/slave driver with a whip, I escaped and flew away",
                                 analysis: "I love action/adventure and the feeling of flying")

      visit edit_user_dream_path(bob, dream)
      fill_in('Title', with: "Flying In Jungle")
      fill_in('Body', with: "Flying away from jungle captives.")
      fill_in('Analysis', with: "Maybe I should be a pilot")
      click_on('Update Dream')

      expect(current_path).to eq(dream_path(dream))
      expect(page).to have_content("Flying In Jungle")
      expect(page).to have_content("Flying away from jungle captives.")
      expect(page).to have_content("Maybe I should be a pilot")
    end
  end
end
