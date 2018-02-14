require 'rails_helper'

describe "user cannot delete a category" do
  describe "user visits category index" do
    it "cannot delete a category" do
      bob = User.create!(user_name: "bob",
                           password: "test",
                           role: 0)
      red = Category.create!(name: "red")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(bob)

      visit categories_path

      expect(page).to_not have_content("delete")
    end
  end
end
