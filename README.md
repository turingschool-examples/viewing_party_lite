# Viewing Party

Lets watch movies! The Viewing Party Lite application enables its users to explore movie options, create a viewing party events for themselves, and inviting other users of the application. This application utilizes the consumption of a public movie API to make a working application. For this application to work you will need to register for a [movie_api_key](https://developers.themoviedb.org/3/getting-started/introduction) and follow the steps [here](#Register).

## Ruby/Rails version

**ruby '2.7.2'**
**rails '5.2.6'**

## Collaborators

- [nikkyrojas](https://github.com/nikkyrojas)
- [Dominicod](https://github.com/Dominicod)

## System dependencies

**ruby '2.7.2'**
**rails '5.2.6'**

#### Testing:

- pry
- rspec-rails
- simplecov
- capybara
- launchy
- shoulda-matchers
- orderly
- webmock
- vcr
- figaro

#### Production:

- Faraday

## Configuration

To setup the project you will first install the system dependencies by running;

```
bundle install
```

## Database creation and initialization

To setup the database first run this command;

```
rails db:{drop,create,migrate,seed}
```

## How to run test suite

If you installed the testing dependencies you will be able to run;

```
bundle exec rspec -fd
```

This will run all of the tests located in the spec folder.

## Project technology

This project is running the following languages and tools:

- Ruby
- RSpec
- Ruby on Rails
- SimpleCov
- MovieDB API
- VCR/Webmock

## DB Design

https://dbdiagram.io/d/63449cbef0018a1c5fd44fd2

## Register

[movie_api_key](https://developers.themoviedb.org/3/getting-started/introduction)

run command: bundle exec figaro install
(this command automatically generates a yml file where you will place you movie api key that you registered for above. Put the following in the yml file: movie_api_key: your_api_key_goes_here )
