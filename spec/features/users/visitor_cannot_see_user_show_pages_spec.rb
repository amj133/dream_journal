require 'rails_helper'

describe "visitors cannot see users' show pages" do
  it "visitor tries to visit show page from users index" do
    bob = User.create!(user_name: "Bob",
                       password: "test")

    visit users_path
    click_on("Bob")

    expect(current_path).to eq(users_path)
    expect(page).to have_content("Need to be logged in")
  end
end
