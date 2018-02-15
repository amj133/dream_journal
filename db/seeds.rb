# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

anonymous = User.create(user_name: "Anonymous", password: 'test')
jim = User.create(user_name: "JimRocks12", password: 'test1', email: "jrocks12@gmail.com")
sally = User.create(user_name: "SallyRocks13", password: 'test2', email: "srocks13@gmail.com")
frank = User.create(user_name: "FrankRocks14", password: 'test3', email: "frocks14@gmail.com")
maybe = User.create(user_name: "MaybeRocks15", password: 'test4', email: "mrocks15@gmail.com")
billy = User.create(user_name: "BillyRocks16", password: 'test5', email: "brocks16@gmail.com")
annemarie = User.create(user_name: "AnnMarieRocks17", password: 'test6', email: "amrocks17@gmail.com")
admin = User.create(user_name: "admin", password: "admin", email: "admin@gmail.com", role: 1)

flying = Category.create(name: "Flying")
outer_space = Category.create(name: "Outer Space")
scary = Category.create(name: "Scary")

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
