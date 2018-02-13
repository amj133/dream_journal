require 'rails_helper'

describe "user can see all categories" do
  describe "visits category index" do
    it "shows list of existing categories" do
      blue = Category.create!(name: "blue")
      red = Category.create!(name: "red")
      green = Category.create!(name: "green")

      visit categories_path

      expect(page).to have_content("List of Dream Categories")
      expect(page).to have_content("blue")
      expect(page).to have_content("red")
      expect(page).to have_content("green")
    end
  end
end
