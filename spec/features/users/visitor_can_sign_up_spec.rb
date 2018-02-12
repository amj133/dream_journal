require 'rails_helper'

describe "visitor can sign up as user" do
  describe "from root can click sign up" do
    it "creates a new user when they submit info" do
      visit '/'
      click_on('Sign up')

      expect(current_path).to eq(new_user_path)

      fill_in('user[user_name]', with: "bobrocks13")
      fill_in('user[email]', with: "brocks13@gmail.com")
      fill_in('user[password]', with: "test")
      click_on('Sign Up Now')

      expect(current_path).to eq(user_path(User.last))
      expect(page).to have_content("Welcome #{User.last.user_name}")
    end
  end
end
