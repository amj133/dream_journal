require 'rails_helper'

describe "user can create a new dream" do
  describe "visits new dream page and fills out information" do
    it "displays new dream on user show page" do
      bob = User.create!(user_name: "BobRocks15",
                         password: 'test',
                         email: "bobrocks@gmail.com")
      blue = Category.create!(name: "blue")

      visit new_user_dream_path(bob)
      fill_in('Title', with: "Lion Encounter")
      fill_in('Body', with: "A group of friends and I were in a mattress shop during a post-apocalyptic-esque scenario.  We were sitting outside the shope when a lion walked out, we all froze, one person tried to run and the lion when after him.  Then the rest of us went inside")
      select('blue', :from => 'dream[category_ids]', match: :first)
      click_on('Create Dream')
      new_dream = Dream.find(1)

      expect(current_path).to eq(dream_path(1))
      expect(page).to have_content(new_dream.title)
      expect(page).to have_content(new_dream.body)
    end
  end

  describe "user can add a category to a dream" do
    describe "user visits dream show page" do
      it "contains links to add category" do
        bob = User.create!(user_name: "BobRocks15",
                           password: 'test',
                           email: "bobrocks@gmail.com")
        blue = Category.create!(name: "blue")
        red = Category.create!(name: "red")
        dream = bob.dreams.create!(title: "Escape From Jungle",
                                   body: "I was a worker on a jungle fortress, there was an overlord/slave driver with a whip, I escaped and flew away",
                                   analysis: "I love action/adventure and the feeling of flying",
                                   category_ids: [2])

        visit dream_path(dream)
        click_on('Add Additional Category')
        select('red', :from => 'dream[new_category_id]')
        click_button('Add Category to Dream')
        updated_dream = Dream.find(2)

        expect(current_path).to eq(dream_path(dream))
        expect(updated_dream.categories).to eq([blue, red])
        expect(page).to have_content("blue")
        expect(page).to have_content("red")
      end
    end
  end
end
