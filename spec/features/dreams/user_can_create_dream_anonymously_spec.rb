require 'rails_helper'

describe "user can create a dream anonymously" do
  describe "visits new dream page" do
    it "creates a dream under anonymous user" do
      bob = User.create!(user_name: "bob",
                         password: "test")
      anonymous = User.create!(user_name: "Anonymous",
                               password: "test")
      red = Category.create!(name: 'red')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(bob)

      visit new_dream_path

      fill_in('Title', with: "Lion Encounter")
      fill_in('Body', with: "A group of friends and I were in a mattress shop during a post-apocalyptic-esque scenario.  We were sitting outside the shope when a lion walked out, we all froze, one person tried to run and the lion when after him.  Then the rest of us went inside")
      select('red', :from => 'dream[category_ids][]')
      check('anonymous?')
      click_on('Create Dream')

      expect(current_path).to eq(dream_path(Dream.last))
      expect(bob.dreams.count).to eq(0)
      expect(anonymous.dreams.count).to eq(1)
    end
  end
end
