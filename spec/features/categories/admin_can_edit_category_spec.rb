require 'rails_helper'

describe "admin can edit a category" do
  describe "admin visits category index" do
    it "can edit a category" do
      admin = User.create!(user_name: "bob",
                           password: "test",
                           role: 1)
      red = Category.create!(name: "red")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit categories_path
      click_on('edit')

      expect(current_path).to eq(edit_admin_category_path(red))

      fill_in('category[name]', with: "blue")
      click_on('Update Category')

      expect(current_path).to eq(categories_path)
      expect(page).to have_content("blue")
    end
  end
end
