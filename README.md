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

### Screenshots of application pages

#### User /register
<img width="344" alt="Screenshot 2022-07-11 at 8 48 03 PM" src="https://user-images.githubusercontent.com/67713820/178391571-8eae79f1-dd68-4577-bdd3-1b29fda33f17.png"><br>

#### User /login
<img width="521" alt="Screenshot 2022-07-11 at 8 48 50 PM" src="https://user-images.githubusercontent.com/67713820/178393004-88736d55-b633-4bc1-b43d-201c463da6f7.png">

### Discover movies /users/{user_id}/discover?
<img width="392" alt="Screenshot 2022-07-11 at 8 52 26 PM" src="https://user-images.githubusercontent.com/67713820/178393402-c7a098fd-09a9-425d-89da-8de8afbbda27.png">

### Top Movies /users/{user_id}/movies?
<img width="322" alt="Screenshot 2022-07-11 at 8 52 42 PM" src="https://user-images.githubusercontent.com/67713820/178393572-047cd880-6e6f-4937-84bf-9ebd7ca6d499.png">


### Movie Details /users/2/movies/424
<img width="1566" alt="Screenshot 2022-07-11 at 9 12 42 PM" src="https://user-images.githubusercontent.com/67713820/178393835-ec99b348-c8f6-44dd-ad1a-805c02b03c1d.png">

### View my viewing parties
<img width="420" alt="Screenshot 2022-07-11 at 8 51 36 PM" src="https://user-images.githubusercontent.com/67713820/178392530-3112a88a-b276-4172-9a38-5e1da5135127.png">


----------
## Testing

Viweing Party was created using Test Driven Development methodology.


#### RSpec testing
Run test suite using `bundle exec rspec`. All tests are currently passing passing.
<img width="1271" alt="Screenshot 2022-07-11 at 9 49 07 PM" src="https://user-images.githubusercontent.com/67713820/178397982-156eeaca-4745-4bed-be00-8e3d8951d5aa.png"><br><br>


#### Simplecov testing

Simplecov shows 83.62% code testing coverage.
<img width="1509" alt="Screenshot 2022-07-11 at 9 52 45 PM" src="https://user-images.githubusercontent.com/67713820/178398334-455cad07-284e-4764-9f45-dadced613224.png"><br><br>
<img width="1387" alt="Screenshot 2022-07-11 at 9 54 26 PM" src="https://user-images.githubusercontent.com/67713820/178398712-a5c5ab00-2e3a-40f6-b9da-5e7412d6fee3.png">


----------

## Schema Details
![Screenshot 2022-07-11 at 9 55 58 PM](https://user-images.githubusercontent.com/67713820/178398915-8c8dc409-8021-45d7-a141-7281e66e8f3b.png)

----------

## Contributor
💻 Tamara Dowis |  [Github](https://github.com/wanderlust-create)  |  [LinkedIn](https://www.linkedin.com/in/tamara-dowis/)



----------
## Practies & Process:
![OOP](https://user-images.githubusercontent.com/64919819/113648808-77684300-964a-11eb-8575-05aeaa946a6f.png)
![TDD](https://user-images.githubusercontent.com/64919819/113648827-7f27e780-964a-11eb-8f9e-dfdc2ed077c5.png)
![MVC](https://user-images.githubusercontent.com/64919819/113648848-8949e600-964a-11eb-833f-91872b6f3fe0.png)
![REST](https://user-images.githubusercontent.com/64919819/113648856-8ea73080-964a-11eb-8e85-6f580a54eaca.png)<br>
[![forthebadge](http://forthebadge.com/images/badges/made-with-ruby.svg)](http://forthebadge.com)
[![forthebadge](http://forthebadge.com/images/badges/built-with-love.svg)](http://forthebadge.com)

