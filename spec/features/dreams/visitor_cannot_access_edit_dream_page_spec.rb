require 'rails_helper'

describe "visitor cannot access edit dream page " do
  it "tries to access via URI" do
    bob = User.create!(user_name: "BobRocks15",
                       password: 'test',
                       email: "bobrocks@gmail.com")
    dream = bob.dreams.create!(title: "Escape From Jungle",
                               body: "I was a worker on a jungle fortress, there was an overlord/slave driver with a whip, I escaped and flew away",
                               analysis: "I love action/adventure and the feeling of flying")

    visit edit_user_dream_path(bob, dream)

    expect(current_path).to eq('/')
    expect(page).to have_content("Need to be logged in")
  end
end
