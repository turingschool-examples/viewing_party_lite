class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    if params[:q] == 'top%20rated'
      @movies = MoviesFacade.get_top_rated_movies
    else params[:q]
      @movies = MoviesFacade.get_movies_by_keyword(params[:q])
    end
  end

  def show
    @user = User.find(params[:user_id])
    @movie_cast = MoviesFacade.get_cast(params[:id]).first(10)
    @movie_details = MoviesFacade.get_details(params[:id])
    @movie_reviews = MoviesFacade.get_reviews(params[:id])
  end
  

end
