class ViewPartiesController < ApplicationController
  def new
    binding.pry
    @user = User.find(params[:user_id])
    movie_id = params[:movie_id]
    @movie = TMDBService.get_movie_by_id(movie_id)
    # binding.pry
  end
end