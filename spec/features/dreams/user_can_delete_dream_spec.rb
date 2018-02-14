require 'rails_helper'

describe "user can delete a dream" do
  describe "user visits user page" do
    it "has link to delete dream" do
      bob = User.create!(user_name: "BobRocks15",
                         password: 'test',
                         email: "bobrocks@gmail.com")
      dream = bob.dreams.create!(title: "Escape From Jungle",
                                 body: "I was a worker on a jungle fortress, there was an overlord/slave driver with a whip, I escaped and flew away",
                                 analysis: "I love action/adventure and the feeling of flying")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(bob)

      visit user_path(bob)
      click_on('Delete')

      expect(current_path).to eq(user_path(bob))
      expect(bob.dreams.count).to eq(0)
      expect(page).to_not have_content("Escape From Jungle")
    end
  end
end
