class MoviesController < ApplicationController
  def index
    movies = MovieService.get_movie_data
  end
  def results

  end
end
