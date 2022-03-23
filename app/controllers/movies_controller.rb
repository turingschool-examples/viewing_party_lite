class MoviesController < ApplicationController
  def index
    @movies = MovieService::TopRated.call
  end
end
