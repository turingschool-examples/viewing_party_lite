# Viewing Party

## Carter Ball and Astrid Hecht

### About this Project

Viewing Part Lite is an application in which users can explore movie options and create a viewing party event for themselves and other users of the application.

Our take on it exhibits polymorphism in the service methods, encapsulation through use of specific controllers and classes as well as private methods for abstraction, and inheritance in the form of the `before_action set_user` in the application controller as it carries through into almost every page.

## Links

Heroku: https://viewing-party-light-ah-cb.herokuapp.com/

Submission Vid: https://www.youtube.com/watch?v=1eEOPZqGEzs

## Future refactoring

* Making a party show page that shows the name and status of everyone invited, with the full details maybe only visible to the host.
* We'd like to create more poros for search and/or credits so we don't have to use the facade directly. 
* We need to add a sad path test for party creation. 
* It would be nice to have some way to make sure that only parties with a valid movie id can be created or that parties without a poster show a placeholder image. 
* We did our best to adhere to MVC but the controllers could definitely be trimmed down and some logic shifted into the models. 


## Local Setup for any other use

1. Fork and Clone the repo
2. Install gem packages: `bundle install`
3. Setup the database: `rails db:setup`


## Versions

- Ruby 2.7.2

- Rails 5.2.6

Example wireframes to follow are found [here](https://backend.turing.edu/module3/projects/viewing_party_lite/wireframes)
