require 'rails_helper'

describe "user can create a new dream" do
  describe "visits new dream page and fills out information" do
    it "displays new dream on user show page" do
      bob = User.create!(user_name: "BobRocks15",
                         password: 'test',
                         email: "bobrocks@gmail.com")
      blue = Category.create!(name: "blue")
      red = Category.create!(name: "red")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(bob)

      visit new_dream_path
      fill_in('Title', with: "Lion Encounter")
      fill_in('Body', with: "A group of friends and I were in a mattress shop during a post-apocalyptic-esque scenario.  We were sitting outside the shope when a lion walked out, we all froze, one person tried to run and the lion when after him.  Then the rest of us went inside")
      select('blue', :from => 'dream[category_ids][]')
      select('red', :from => 'dream[category_ids][]')
      click_on('Create Dream')
      new_dream = Dream.find(1)

      expect(current_path).to eq(dream_path(1))
      expect(page).to have_content(new_dream.title)
      expect(page).to have_content(new_dream.body)
      expect(page).to have_content(blue.name)
      expect(page).to have_content(red.name)
    end
  end
end
