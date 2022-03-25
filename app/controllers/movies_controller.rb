class MoviesController < ApplicationController

  def index
    @user = User.find(params[:user_id])

      if params[:search] && params[:search].blank?
        []
      elsif params[:search]
        @movies = MovieFacade.search_movie_details(params[:search])
      else
        @movies = MovieFacade.top_rated_movies
      end
  end

  def show
    @movie = MovieFacade.movie_details(params[:id])
    @user = User.find(params[:user_id])
    @cast = MovieFacade.cast_members(params[:id]).first(10)
    @review = MovieFacade.reviews(params[:id])
  end
end
