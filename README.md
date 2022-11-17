# Background and Description

Viewing Part Lite is an application that consumes the [The Movie DB API](https://developers.themoviedb.org/3/getting-started/introduction) to allow users to explore movie options, create viewing parties and invite friends to join in watching. Features include browsing top rated movies, searching for movies by title, creating viewing parties for a movie, and viewing movie data such as vote average, cast, runtime, and reviews. The app implements both authorization and authentication by restricting access to certain features to registered users and limiting admin access to only those registered as an admin account.

## Built With 
   ![RoR](https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white)
   ![pgsql](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
   ![heroku](https://img.shields.io/badge/Heroku-430098?style=for-the-badge&logo=heroku&logoColor=white)  

## Gems 
   ![rspec](https://img.shields.io/gem/v/rspec-rails?label=rspec&style=flat-square)
   ![shoulda](https://img.shields.io/gem/v/shoulda-matchers?label=shoulda-matchers&style=flat-square)
   ![capybara](https://img.shields.io/gem/v/capybara?label=capybara&style=flat-square)
   ![simplecov](https://img.shields.io/gem/v/simplecov?label=simplecov&style=flat-square)
   ![VCR](https://img.shields.io/gem/v/vcr?label=VCR&style=flat-square)
   ![webmock](https://img.shields.io/gem/v/webmock?label=webmock&style=flat-square)
   ![figaro](https://img.shields.io/gem/v/figaro?color=blue&label=figaro)
   ![faker](https://img.shields.io/gem/v/faker?color=blue&label=faker)
   ![factory bot](https://img.shields.io/gem/v/factory_bot_rails?color=blue&label=factory_bot_rails)
   ![faraday](https://img.shields.io/gem/v/faraday?color=blue&label=faraday)

<img width="444" alt="dashboard-party" src="https://user-images.githubusercontent.com/99758586/198903816-0311d75d-95dd-439b-adae-103160029ae0.png">

<img width="1438" alt="monsters-party" src="https://user-images.githubusercontent.com/99758586/198903828-fc67542e-8313-4da6-9336-2d41ef4aa6b6.png">


## [Visit Viewing Party Lite here](https://viewing-movie-party.herokuapp.com/)

<img width="899" alt="viewing party diagram new" src="https://user-images.githubusercontent.com/99758586/198902951-64c07291-1fee-4b9f-a4db-b8fce83f31b8.png">

## Setup

* This project requires Ruby 2.7.4 and Rails 5.2.6

1. Fork and Clone this repo
2. Install gem packages: `bundle install`
3. Setup the database: `rails db:create`
4. Run migrations: `rails db:migrate`

### Contributors to this project include:

[AJ Krumholz](https://github.com/ajkrumholz), [Sid Mann](https://github.com/sjmann2)
