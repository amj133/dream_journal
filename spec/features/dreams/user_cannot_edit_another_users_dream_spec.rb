require 'rails_helper'

describe "user cannot edit another user's dream" do
  it "they try to access edit page through uri" do
    bob = User.create!(user_name: "BobRocks15",
                       password: 'test',
                       email: "bobrocks@gmail.com",
                       role: 0)
    dream = bob.dreams.create!(title: "Escape From Jungle",
                               body: "I was a worker on a jungle fortress, there was an overlord/slave driver with a whip, I escaped and flew away",
                               analysis: "I love action/adventure and the feeling of flying")
    sally = User.create!(user_name: "SallyRocks13",
                         password: 'test',
                         email: "sallyrocks@gmail.com",
                         role: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(sally)

    visit edit_user_dream_path(bob, dream)

    expect(current_path).to eq(user_path(sally))
  end
end
