require 'rails_helper'

describe "visitor cannot access new dream page" do
  it "attempts to access via URI" do
    bob = User.create!(user_name: "BobRocks15",
                       password: 'test',
                       email: "bobrocks@gmail.com")

    visit new_dream_path

    expect(current_path).to eq('/')
    expect(page).to have_content("Need to be logged in")
  end
end
