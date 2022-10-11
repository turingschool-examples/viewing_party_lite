# Viewing Party

Let watch movies! Viewing Party Application coordinates movie viewing parties! Want to watch a movie with others? This application enables it's users to be be added into existing viewing parties or hosting some themselves! All you have to do is register! This application utilizes the consumption of a public movie API to make a working application. For this application to work you will need to register for a [movie_api_key](https://developers.themoviedb.org/3/getting-started/introduction).

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

## Register for Movie API Key

[movie_api_key](https://developers.themoviedb.org/3/getting-started/introduction)
disco
