require 'rails_helper'

describe "user can see all dreams in a category" do
  describe "visits category show page" do
    it "shows all dreams within given category" do
      blue = Category.create!(name: "blue")
      red = Category.create!(name: "red")
      bob = User.create!(user_name: "BobRocks15",
                         email: "bobrocks@gmail.com")
      sally = User.create!(user_name: "SallyRocks15",
                           email: "sallyrocks@gmail.com")
      bob_dream = bob.dreams.create!(title: "Escape From Jungle",
                                     body: "I was a worker on a jungle fortress, there was an overlord/slave driver with a whip, I escaped and flew away",
                                     analysis: "I love action/adventure and the feeling of flying")
      DreamCategory.create!(dream: bob_dream, category: blue)
      sally_dream = sally.dreams.create!(title: "Soaring",
                                         body: "I had eagles wings and was soaring over Denver")
      DreamCategory.create!(dream: sally_dream, category: red)

      visit category_path(blue)

      expect(page).to have_content("All dreams under category: blue")
      expect(page).to have_content("#{bob_dream.title} : #{bob.user_name}")
      expect(page).to_not have_content("#{sally_dream.title} : #{sally.user_name}")
    end
  end
end
