require 'rails_helper'

describe "user can create a new dream" do
  describe "visits new dream page and fills out information" do
    it "displays new dream on user show page" do
      bob = User.create!(user_name: "BobRocks15",
                         email: "bobrocks@gmail.com")

      visit new_user_dream_path(bob)
      fill_in('Title', with: "Lion Encounter")
      fill_in('Body', with: "A group of friends and I were in a mattress shop during a post-apocalyptic-esque scenario.  We were sitting outside the shope when a lion walked out, we all froze, one person tried to run and the lion when after him.  Then the rest of us went inside")
      click_on('Create Dream')
      new_dream = Dream.find(1)

      expect(current_path).to eq(dream_path(1))
      expect(page).to have_content(new_dream.title)
      expect(page).to have_content(new_dream.body)
    end
  end
end
