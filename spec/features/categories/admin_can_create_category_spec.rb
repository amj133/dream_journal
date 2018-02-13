require 'rails_helper'

describe "admin can create a category" do
  describe "admin visits category index" do
    it "can create a new category" do
      admin = User.create!(user_name: "bob",
                           password: "test",
                           role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit categories_path
      click_on('Create new dream category')

      expect(current_path).to eq(new_admin_category_path)

      fill_in('category[name]', with: "scary")
      click_on('Create Category')

      expect(current_path).to eq(categories_path)
      expect(page).to have_content("scary")
    end
  end
end
