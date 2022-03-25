# # Viewing Party

Table of Contents

About The Project
Setup for the use of the project
Local Setup for any other use
Versions
Database Schema
Built With
Setup Instructions

This is the base repo for the [Viewing Party Lite project](https://backend.turing.io/module3/projects/viewing_party_lite) used for Turing's Backend Module 3.

### About this Project

Viewing Part Lite is an application in which users can explore movie options and create a viewing party event for themselves and other users of the application.

## Setup for the use of the project

1. A conveyor belt link will be sent out at project kickoff so that you can both fork and copy the project board on this base repo. 

## Local Setup for any other use

1. Fork and Clone the repo: [GitHub - stevenjames-turing/viewing_party_lite](https://github.com/stevenjames-turing/viewing_party_lite)
2. Install gem packages: `bundle install`
3. Setup the database: `rails db:create`


## Versions

- Ruby 2.7.2

- Rails 5.2.6
- 
## Built With:

Ruby on Rails
Postgresql
Bootstrap
MovieDB API

## Setup Instructions
To get a local copy up and running follow these steps:

1. Clone the repo
git clone : git@github.com:stevenjames-turing/viewing_party_lite.git
2. Install dependencies
bundle install
3. DB creation/migration
rails db:create
rails db:migrate
rails db:seed
4. Run tests and view test coverage
bundle exec rspec
open coverage/index.html
5. Run server and navigate to http://localhost:3000/
rails s

OR

Visit heroku: [ViewingPartyLite](https://enigmatic-sea-76964.herokuapp.com/)


Example wireframes to follow are found [here](https://backend.turing.io/module3/projects/viewing_party_lite/wireframes)
