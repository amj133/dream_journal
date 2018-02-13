require 'rails_helper'

describe "user can edit a category" do
  describe "user visits category index" do
    it "can edit an existing category" do
      category = Category.create!(name: "blue")
      visit categories_path
      click_on('edit')

      expect(current_path).to eq(edit_category_path(category))

      fill_in('category[name]', with: "red")
      click_on('Update Category')

      expect(current_path).to eq(categories_path)
      expect(page).to have_content("red")
    end
  end
end
