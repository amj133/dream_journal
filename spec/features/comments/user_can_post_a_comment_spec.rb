require 'rails_helper'

describe "user can post a comment on a dream" do
  describe "visits a dream show page" do
    it "posts a comment" do
      bob = User.create!(user_name: "BobRocks15",
                         email: "bobrocks@gmail.com")
      dream = bob.dreams.create!(title: "Escape From Jungle",
                                 body: "I was a worker on a jungle fortress, there was an overlord/slave driver with a whip, I escaped and flew away",
                                 analysis: "I love action/adventure and the feeling of flying")

      visit dream_path(dream)
      fill_in('comment[user_name]', with: "BobRocks")
      fill_in('comment[body]', with: "Thats a crazy dream")
      click_on('Post Comment')

      expect(current_path).to eq(dream_path(dream))
      expect(page).to have_content("Comments:")
      expect(page).to have_content("User Name: BobRocks")
      expect(page).to have_content("Thats a crazy dream")
    end
  end
end
