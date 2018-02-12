require 'rails_helper'

describe "existing user can log in" do
  it "allows existing user to log in" do
    bob = User.create!(user_name: "BobRocks15",
                       password: 'test',
                       email: "bobrocks@gmail.com")

    visit '/'
    click_on('Log in here')

    expect(current_path).to eq(login_path)

    fill_in('user_name', with: bob.user_name)
    fill_in('password', with: bob.password)
    click_on('Log In')

    expect(current_path).to eq(user_path(bob))
    expect(page).to have_content("#{bob.user_name}'s Dream Journal")
  end
end
