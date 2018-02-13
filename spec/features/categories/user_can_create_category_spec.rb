require 'rails_helper'

describe "user can create a category" do
  describe "user visits category index" do
    it "can create a new category" do
      visit categories_path
      click_on('Create new dream category')

      expect(current_path).to eq(new_category_path)

      fill_in('category[name]', with: "scary")
      click_on('Create Category')

      expect(current_path).to eq(categories_path)
      expect(page).to have_content("scary")
    end
  end
end
