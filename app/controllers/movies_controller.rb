class MoviesController < ApplicationController
   def index
      @movies = MoviesFacade.top_rated_movies
   end
end