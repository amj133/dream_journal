# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

jim = User.create(user_name: "JimRocks12", email: "jrocks12@gmail.com")
sally = User.create(user_name: "SallyRocks13", email: "srocks13@gmail.com")
frank = User.create(user_name: "FrankRocks14", email: "frocks14@gmail.com")
maybe = User.create(user_name: "MaybeRocks15", email: "mrocks15@gmail.com")
billy = User.create(user_name: "BillyRocks16", email: "brocks16@gmail.com")
annemarie = User.create(user_name: "AnnMarieRocks17", email: "amrocks17@gmail.com")

jim.dreams.create(title: "Giant",
                  body: "I was a giant and couldn't fit in my bed.  I tried to go to work and people looked at me weird",
                  analysis: "not sure really")
jim.dreams.create(title: "Hunter",
                  body: "I was hunting a saber tooth tiger with a pack of neanderthals",
                  analysis: "I need new friends")
sally.dreams.create(title: "Monkey",
                  body: "I was a monkey swinging from tree to tree high up in a jungle canopy.  It was liberating.",
                  analysis: "I need more adventure in my life")
frank.dreams.create(title: "Jelly Beans",
                  body: "I was buriend in a jar of jelly beans",
                  analysis: "I am stressed at work")
