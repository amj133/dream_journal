require 'rails_helper'

describe "visitor cannot post comment on a dream" do
  describe "visits a dream show page" do
    it "tries and fails to post a comment" do
      bob = User.create!(user_name: "BobRocks15",
                         password: 'test',
                         email: "bobrocks@gmail.com")
      dream = bob.dreams.create!(title: "Escape From Jungle",
                                 body: "I was a worker on a jungle fortress, there was an overlord/slave driver with a whip, I escaped and flew away",
                                 analysis: "I love action/adventure and the feeling of flying")

      visit dream_path(dream)
      fill_in('comment[user_name]', with: "Sally")
      fill_in('comment[body]', with: "Thats a crazy dream")
      click_on('Create Comment')

      expect(current_path).to eq(dream_path(dream))
      expect(page).to have_content("Need to be logged in")
      expect(page).to_not have_content("Sally")
      expect(page).to_not have_content("Thats a crazy dream")
    end
  end
end
