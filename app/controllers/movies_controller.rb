class MoviesController < ApplicationController
  def top_movies
    @movies = MovieFacade.new
  end

  def movie_details
    @movie = MovieFacade.new(params[:id])
    @movie_id = params[:id]
    @user = User.first
    # require 'pry'; binding.pry
  end
end
