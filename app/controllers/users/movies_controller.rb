class Users::MoviesController < ApplicationController
  
  def index
    @search_term = params[:title_search]

    if @search_term
      @movies = movie_service.search_movies(@search_term)
    else
      @movies = movie_service.get_top_movies
    end
    @user = User.find(params[:user_id])
  end

  private

  def movie_service
    MovieService.new
  end
end
