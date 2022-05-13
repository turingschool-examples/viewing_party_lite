# Viewing Party

[Viewing Party](https://viewing-party-jhst.herokuapp.com/) is an application in which users can explore movie options and create a viewing party event for themselves and other users of the application.

## Production

This app is currently deployed to Heroku at [this link](https://viewing-party-jhst.herokuapp.com/).

## Technology

- Ruby 2.7.2
- Rails 5.2.8

## Installation

To pull down this repository and inspect the code locally, see below instructions: 

1. Fork this repository. 
2. Clone your fork to your local computer. 
3. Set your Ruby version to 2.7.2 and your Rails version to 5.2.8.
4. Install gem packages: `bundle install`
5. Setup the database: `rails db:{create,migrate}`
6. Tests can be run by running `bundle exec rspec` in your CLI. 

## Database Schema

This app uses a many-to-many relational database: Users have many Invitations, and many Parties through Invitations. Parties have many Invitations, and many Users through Invitations. Invitations belong to a User and a Party. Movie data are displayed using a Movie PORO Class, objects of which are generated through the MovieService and MovieFacade classes. 

![image](https://user-images.githubusercontent.com/93609855/168385176-bb2a65fc-19d9-41b7-8ac7-1aae385d09cb.png)

## Contributors 

- James Harkins ([GitHub](https://github.com/James-Harkins))
- Sandisz Thieme ([GitHub](https://github.com/sandisz-d734m37))
