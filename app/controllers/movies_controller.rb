class MoviesController < ApplicationController
  def top_rated
    @user = User.find(params[:user_id])
    @movies = MovieFacade.top_rated_movies
    render "movies/index"
  end

  def search
    keyword = params[:query]
    @user = User.find(params[:user_id])
    @movies = MovieFacade.search_movie(keyword)
    render "movies/index"
  end

  def discover 
    @user = User.find(params[:user_id])
  end

  def index
  end

  def show 
    @user = User.find(params[:user_id])
    @data = MovieFacade.movie_info(params[:id])

    render "movies/show"
  end

end