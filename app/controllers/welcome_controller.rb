class WelcomeController < ApplicationController

  def index
    top_rated_movies = MoviesFacade.find_top_rated
    @users = User.all
  end

end
