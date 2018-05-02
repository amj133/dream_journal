# DreamJournal

This application is built to allow users to record and share dreams.  Users can view other users dreams and comment on them.  Visitors can view dreams but cannot comment or add their own dreams.  This was my first application built using Rails with an emphasis on authentication and authorization for various levels of user experience.  The site offers seperate functionality for guests, users, and administrators. Authentication of users is performed using bcrypt.  While registered users can post (with an option for anonymous), edit, and delete their own dreams, as well as comment on others dreams, administrators can delete comments and dreams and categorize dreams.  I would like to add functionality that allows users to search for dream posts based on keywords.   

See the deployed project here: [DreamJournal](https://cryptic-ravine-32891.herokuapp.com/)

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. 

For information on using our application in the deployed see [deployment](#deployment)

1. clone down this project and change into the directory
```
git clone https://github.com/amj133/dream_journal.git
bundle install
```
2. create and migrate the database
```
rake db:create
rake db:migrate
```
3. Run rails server and visit localhost:3000 in your browser
```
rails s
```
*visit http://localhost:3000 in your browser
*enjoy!

### Prerequisites

* Ruby 2.4+
* Rails 5

## Running the tests

To run the tests, follow the instructions in [Getting Started](#getting-started) above first.  Open rails server in a separate tab then run rspec.
```
rspec
```
##### Tests include: 
* feature tests for logging in, registering an account and visiting the user dashboard
* mailer tests for user receiving an API key and a link to activate their account 
* model tests of all ActiveRecord and PORO models
* service tests of all PORO services
* request tests of all API request endpoints

##### Tools and gems used for testing:
* [rspec](https://github.com/rspec/rspec-rails)
* [pry](https://github.com/pry/pry)
* [capybara](https://github.com/teamcapybara/capybara)
* [launchy](https://github.com/copiousfreetime/launchy)
* [shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers)
* [database_cleaner](https://github.com/DatabaseCleaner/database_cleaner)
* [active-designer](https://github.com/thompickett/active_designer)



## Deployment

To get set up on the deployed heroku app, visit the application [DreamJournal](https://cryptic-ravine-32891.herokuapp.com/), and register for an account.

## Contributing

Feel free to make pull requests or comments to contribute to this application. I am happy to receive your feedback!

## Authors

* [Andrew Jeffery](https://github.com/amj133)


## Acknowledgments

* Thank you to our awesome instructors at Turing!
