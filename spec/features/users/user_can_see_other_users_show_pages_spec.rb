require 'rails_helper'

describe "user can see other users show pages" do
  it "user visits show page from users index" do
    bob = User.create!(user_name: "Bob",
                       password: "test")
    sally = User.create!(user_name: "Sally",
                         password: "test")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(bob)
    visit users_path
    click_on("Sally")

    expect(current_path).to eq(user_path(sally))
    expect(page).to have_content("Sally's Dream Journal")
  end
end
