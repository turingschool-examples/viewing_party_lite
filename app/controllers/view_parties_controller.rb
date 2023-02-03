class ViewPartiesController < ApplicationController
  def new
    movie_id = params[:movie_id]
    @movie = TMDBService.get_movie_by_id(movie_id)
    # binding.pry
  end
end