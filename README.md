# Viewing Party

### Table of Contents

- About The Project
- Database Design
- Getting Started
- Built With
- Testing

## About The Project

- Viewing Part Lite is an application in which users can explore movie options and create a viewing party event for themselves and other users of the application.
- Utilized API consumption from [The MovieDB](https://www.themoviedb.org/)
- This is the Pair Project in Mod 3 of Turing's Back-End Program (2111 BE Cohort)
- Available on Heroku at [ViewingPartyLite](https://enigmatic-sea-76964.herokuapp.com/)
- [Turing Project Page](https://backend.turing.edu/module3/projects/viewing_party_lite/index)

## Database Design

![viewing_party_db_design](https://user-images.githubusercontent.com/91357724/160152902-de49c3e1-fa1c-4364-b7f4-d4518a609159.png)

## Getting Started

1. Fork and Clone the repo: [GitHub - stevenjames-turing/viewing_party_lite](https://github.com/stevenjames-turing/viewing_party_lite)
2. Install gem packages: `bundle install`
3. Setup the database: `rails db:{create,migrate,seed}`

## Built With:

- Framework: Ruby on Rails
- Database: PostgreSQL
- API: The MovieDB API
- Styling: Bootstrap, CSS, HTML5
- Versions
  - Ruby: 2.7.4
  - Rails: 5.2.6

## Testing:

  - All Features and Models are fully tested using RSpec. 
  - You can run RSpec on any directory/file using `bundle exec rspec <directory/file>`
  - SimpleCov is included to ensure tests have full coverage.
  - To run the Simplecov report type the following into your terminal: open coverage/index.html
  - See details here: [SimpleCov](https://github.com/simplecov-ruby/simplecov)

### Authors
   -[Steven James](https://github.com/stevenjames-turing)<br>
   -[Becky Nisttahuz](https://github.com/benistta)
