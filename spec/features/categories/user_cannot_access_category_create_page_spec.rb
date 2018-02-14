require 'rails_helper'

describe "admin can create a category" do
  describe "admin visits category index" do
    it "can create a new category" do
      bob = User.create!(user_name: "bob",
                           password: "test",
                           role: 0)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(bob)

      visit categories_path

      expect(page).to_not have_content("Create new dream category")
      expect(page).to_not have_content("edit")
      expect(page).to_not have_content("delete")
    end
  end
end
