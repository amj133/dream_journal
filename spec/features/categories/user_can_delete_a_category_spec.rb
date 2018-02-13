require 'rails_helper'

describe "user can delete category" do
  describe "user visists category index" do
    it "allows user to delete category" do
      category = Category.create!(name: "blue")
      visit categories_path
      click_on('delete')

      expect(current_path).to eq(categories_path)
      expect(page).to_not have_content("red")
      expect(Category.all.count).to eq(0)
    end
  end
end
