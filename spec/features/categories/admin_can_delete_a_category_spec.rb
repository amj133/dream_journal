require 'rails_helper'

describe "admin can can delete category" do
  describe "admin visits category index" do
    it "allows admin to delete category" do
      admin = User.create!(user_name: "bob",
                           password: "test",
                           role: 1)
      red = Category.create!(name: "red")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit categories_path
      click_on('delete')

      expect(current_path).to eq(categories_path)
      expect(page).to_not have_content("red")
      expect(Category.all.count).to eq(0)
    end
  end
end
