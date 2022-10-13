class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    search = params[:search]
    if search == ''
      redirect_to user_discover_index_path(@user), notice: 'Search field cannot be blank'
    elsif !search.nil?
      @movies = MoviesFacade.find_search_movies(search)
    else
      @movies = MoviesFacade.find_top_movies
    end
  end

  def show
    @user = User.find(params[:user_id])
    movie_id = params[:id]
    @movie = MoviesFacade.find_movie(movie_id)
    @cast = MoviesFacade.find_cast(movie_id)
    @reviews = MoviesFacade.find_reviews(movie_id)
  end
end
