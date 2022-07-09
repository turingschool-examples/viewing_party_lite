class MoviesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    # binding.pry
    if params[:search].present?
      @movies = MovieFacade.film_search(params[:search])
    else
      @movies = MovieFacade.top_rated_array
    end
  end

  def show
    @user = User.find(params[:user_id])
    @movie = MovieFacade.movie_id_search(params[:id])
    @movie_cast = MovieFacade.movie_cast(params[:id]).first(10)
    @movie_review = MovieFacade.movie_reviews(params[:id])
  end
end

