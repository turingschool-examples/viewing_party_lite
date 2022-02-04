# Viewing Party: Turing 2110 BE Mod 3

## Description
This is the base repo for the [Viewing Party Lite project](https://backend.turing.io/module3/projects/viewing_party_lite) used for Turing's Backend Module 3.

Viewing Part Lite is an application in which users can explore movie options and create a viewing party event for themselves and other users of the application.

## Learning Goals

## Schema
![Screen Shot 2022-02-03 at 3 54 19 PM](https://user-images.githubusercontent.com/89048720/152448822-361a29dc-2459-44de-a3fb-e38003247311.png)

## Local Setup

1. Fork and Clone the repo `git clone git@github.com:Dittrir/viewing_party_lite.git`
2. Navigate to directory `cd viewing_party_lite`
3. Install gem packages: `bundle install`
4. Update gem packages: `bundle update`
5. Install figaro: `bundle exec figaro install`
6. Add the api key to the application.yml file: In the `app/config/application.yml` file, scroll to the bottom and add the line `movie_api_key: <YOUR KEY HERE>` to the bottom of the page. You can retrieve the key [here](https://developers.themoviedb.org/3/getting-started/introduction).
7. Setup the database: `rails db:{create, migrate}`

## Heroku Deployment
- Use [this link](https://fast-oasis-29244.herokuapp.com/) to access this app on heroku.

## Versions

- Ruby 2.7.2
- Rails 5.2.6

## Gems
- RSpec
- Pry
- SimpleCov
- Shoulda-matchers
- Figaro
- Rubocop-rails
- Faraday
- Launchy
- Webmock
- VCR

Contributors
Robin Dittrich, David Kassin, Wade Naughton
