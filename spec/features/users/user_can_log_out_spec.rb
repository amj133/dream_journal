require 'rails_helper'

describe "user can log out" do
  it "user selects log out from show page" do
    bob = User.create!(user_name: "BobRocks15",
                       password: 'test',
                       email: "bobrocks@gmail.com")

    visit '/'
    click_on('Log in here')

    expect(current_path).to eq(login_path)

    fill_in('user_name', with: bob.user_name)
    fill_in('password', with: bob.password)
    click_on('Log in')
    click_on('Log out')

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Please log in")
  end
end
