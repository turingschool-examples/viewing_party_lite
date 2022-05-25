class MoviesController < ApplicationController
  def index
    @user = User.find(session[:user_id])

    if params[:keyword]
      @movies = MovieFacade.search(params[:keyword])
    else
      @movies = MovieFacade.top_rated_movies
    end
  end

  def show
    @user = User.find(session[:user_id])
    @movie = MovieFacade.movie_details(params[:movie_id])
    @review = MovieFacade.reviews(params[:movie_id])
    @cast = MovieFacade.cast_members(params[:movie_id])
  end
end
