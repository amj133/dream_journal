require 'rails_helper'

describe "user cannot access edit category page" do
  describe "user visits category index" do
    it "cannot access edit category page" do
      bob = User.create!(user_name: "bob",
                           password: "test",
                           role: 0)
      red = Category.create!(name: "red")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(bob)

      visit categories_path
      click_on('edit')

      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
