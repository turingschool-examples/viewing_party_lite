class WelcomeController < ApplicationController
  def index
    @users = User.all

    @top_movies = MovieFacade.top_rated_movies
  end
end
