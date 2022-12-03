class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    if params[:top_rated].present?
      @top_rated_movies = MovieFacade.top_rated
    else
      params[:keyword]
      @keyword = params[:keyword]
      @results = MovieFacade.search_movies(@keyword)
    end
  end

  def show
    @user = User.find(params[:user_id])
    id = params[:id]
    @movie = MovieFacade.movie_id(id)
    @reviews = MovieFacade.movie_reviews(id)
    @cast = MovieFacade.movie_cast(id)
  end
end
