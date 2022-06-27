# Viewing Party

## About this Project

Viewing Part Lite is an application in which users can explore movie options and create a movie viewing event for themselves and other users of the application.

This project was completed during my 13th week at Turing School of Software and Design in the Backend Software Development Program. It was assigned as a paired project to be completed in a 4 day sprint. Since the original submission I have refactored and added features as I learned new skills. It was my first time consuming an external API that required authentication, and my first time implementing the Service/Facade/Poro design. I will continue to practice new skills on this application as I learn them. More details about what I have added are listed below in **Project Progress**. Thank you for taking an interest and I look forward to any questions you may have.

This is the base repo for the [Viewing Party Lite project](https://backend.turing.io/module3/projects/viewing_party_lite) used for Turing's Backend Module 3.

## Learning Goals for this Project
1. Consume multiple endpoints from an external API that requires authentication 
2. Test consumption of APIs with RSpec
3. Utlize Facade/Service/Poro design 
4. Organize and refactor code to be more maintainable
5. Implement login functionality and authentication in app using session 
6. Test API calls using webmock, VCR 

## Deployment
The Viewing Party app is deployed on Heroku. 
Check it out 👀 [here](https://dashboard.heroku.com/apps/salty-oasis-88675)

## Local Setup for Project

1. Fork and Clone the repo
2. Install gem packages: `bundle install`
3. Setup the database: `rails db:{create,migrate}`
4. Run `bundle exec figaro install`
5. Go to [The Movie Database](https://www.themoviedb.org/signup) create an account and request an API key
6. Add your API key to the `application.yml` file that the Figaro gem creates 
  ```rb
  movie_api_key: your_api_key
  ```

## Project Progress
This project was originally a paired project completed over 4 days, using both Driver/Navigator and working asynchronously reviewing each other's code on GitHub before merging to main and deploying to Heroku. The `original_submission` branch hosts the code that was completed when the project was due.

After it was submitted I used it to practice refactoring and apply the features and tests that did not make it into our original submission. These additions can be found on the branch `post_project`.

In the weeks after this project we learned about authentication and sessions and I implemented those features into this app, followed by authorization and Bootstrap.

The latest version of the complete project is found on the `main` branch.

## Gems Used
* [rspec-rails](https://github.com/rspec/rspec-rails)
* [capybara](https://github.com/teamcapybara/capybara)
* [shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers)
* [simplecov](https://github.com/simplecov-ruby/simplecov)
* [webmock](https://github.com/bblimke/webmock)
* [faraday](https://github.com/lostisland/faraday)
* [figaro](https://github.com/laserlemon/figaro)
* [bootstrap](https://getbootstrap.com/)
* [bycrypt](https://github.com/bcrypt-ruby/bcrypt-ruby)

## Versions

- Ruby 2.7.2

- Rails 5.2.6

Example wireframes to follow are found [here](https://backend.turing.io/module3/projects/viewing_party_lite/wireframes)
