require 'rails_helper'

describe "user can see all contributors" do
  it "shows list of contributors at user index" do
    bob = User.create!(user_name: "Bob",
                       password: "test")
    sally = User.create!(user_name: "Sally",
                         password: "test")

    visit users_path

    expect(page).to have_content(bob.user_name)
    expect(page).to have_content(sally.user_name)
  end
end
