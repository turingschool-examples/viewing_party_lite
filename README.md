<img src="https://user-images.githubusercontent.com/67713820/178377837-e5a25111-6b84-4434-8a60-bd08f46454c1.png" alt="logo" max-width="600"><br>

# Viewing Party
![rails-badge](https://img.shields.io/badge/Rails-5.2.6-blue) ![ruby-badge](https://img.shields.io/badge/Ruby-2.7.4-orange)
[![GitHub version](https://badge.fury.io/gh/wanderlust-create%2Fwhether_sweater.svg)](https://badge.fury.io/gh/wanderlust-create%whether_sweater)
[![PRsWelcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=shields)](http://makeapullrequest.com)

### Learning Goals for this project:
Explicit
- Determine completion criteria based on the needs of other developers
- Consume JSON APIs that require authentication
- Test consumption of APIs (facade,service,poros)
- Organize and refactor code to be more maintainable
- Apply RuboCop’s style guide for code quality
- Deploy to Heroku
- Research, select, and consume an API based on your needs as a developer

Implicit
- Reading Documentation
- Implementing concepts that are not explicitly taught
- Practice individual research (articles, videos, mentors)
- Team communication
- Prioritizing goals/user stories
- Time management

Reference: [Project Specs and Overview](https://backend.turing.io/module3/projects/viewing_party_lite)

### About this Project

Viewing Part Lite is an application in which users can search for movies, view top rated movies,  and create a viewing party event for themselves and other users of the application.

Example wireframes to follow are found [here](https://backend.turing.io/module3/projects/viewing_party_lite/wireframes)

----------
### Getting Started

#### Versions 
- Ruby 2.7.4
- Rails 5.2.6

----------

##### Gems

User Authentication | [bcrypt](https://github.com/bcrypt-ruby/bcrypt-ruby) | 

API | [jsonapi-serializer](https://github.com/fotinakis/jsonapi-serializers) | [figaro](https://github.com/p2t2/figaro) | [faraday](https://github.com/lostisland/faraday) | 

Testing | [rspec-rails](https://github.com/rspec/rspec-rails) | [simplecov](https://github.com/simplecov-ruby/simplecov) | [capybara](https://github.com/teamcapybara/capybara) | [webmock](https://github.com/bblimke/webmock) | [shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers) | [VCR](https://github.com/vcr/vcr) | [pry](https://github.com/pry/pry) |

----------
##### API key registeration needed

- [The Movie Database](https://www.themoviedb.org/documentation/api)<br>

----------

### Set Up: 
You will need to apply for your own unique API keys from the above API data provider<br>
On your local system, open a terminal session to run the following commands:
1. Clone this repository:`git@github.com:wanderlust-create/viewing_party_lite.git`
3. Navigate to the newly cloned directory:`cd viewing_party_lite`
4. If bundler is not installed run:`gem install bundler`
5. To install the required Gems run:`bundle install`
6. If errors occur, check for proper installation and versions of:`bundler`, `ruby`, and `rails`
7. Add file to store your unique API keys:`touch config/application.yml`, `atom config/application.yml'
8. Add your unique API keys to the `/config/application.yml` file as follows:<br>
```
api_key: your unique TMDB API key 

```
9. Set up the database locally with:`rails db:{drop, create, migrate }`
10. Open your text editor and check to see that `schema.rb` was created.
11. You may also run the RSpec test suite locally with the command `bundle exec rspec` to ensure everything is functioning as expected.

----------

### Data returned from API:
- 

----------

