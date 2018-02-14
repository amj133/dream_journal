require 'rails_helper'

describe "user cannot delete comment" do
  describe "visits dream show page" do
    it "cannot delete a comment" do
      bob = User.create!(user_name: "bob",
                           password: "test")
      sally = User.create!(user_name: "sally",
                         password: "test_1")
      dream = sally.dreams.create!(title: "flying",
                                   body: "I was flying")
      comment = dream.comments.create!(user_name: "billy",
                                       body: "i like flying too!")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(bob)

      visit dream_path(dream)

      expect(page).to_not have_content('delete comment')
    end
  end
end
