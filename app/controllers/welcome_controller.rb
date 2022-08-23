class WelcomeController < ApplicationController
  def index
    @top_movies = MovieFacade.top_movies
  end
end
