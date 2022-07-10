class MoviesController < ApplicationController

  def index
    @user = User.find(params[:user_id])

    if params[:movie_title]
      @movies = MovieFacade.create_search_movie(params[:movie_title])
    elsif
      @movies = MovieFacade.create_top_movies
    end
  end
end
