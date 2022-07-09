class MoviesController < ApplicationController
  def index
    # binding.pry
    @user = User.find(params[:user_id])
    if params[:movie_search].present?
      @movies = MovieFacade.all_movie_id_search(id)
    else
      @movies = MovieFacade.top_rated_array

    binding.pry
  end
end