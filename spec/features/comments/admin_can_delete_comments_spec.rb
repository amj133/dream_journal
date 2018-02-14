require 'rails_helper'

describe "admin can delete a comment" do
  describe "visits dream show page" do
    it "can delete a comment" do
      admin = User.create!(user_name: "bob",
                           password: "test",
                           role: 1)
      sally = User.create!(user_name: "sally",
                         password: "test_1")
      dream = sally.dreams.create!(title: "flying",
                                   body: "I was flying")
      comment = dream.comments.create!(user_name: "billy",
                                       body: "i like flying too!")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit dream_path(dream)
      click_on('delete comment')

      expect(current_path).to eq(dream_path(dream))
      expect(page).to_not have_content(comment.user_name)
      expect(page).to_not have_content(comment.body)
    end
  end
end
