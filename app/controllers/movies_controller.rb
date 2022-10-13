class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    if params[:search]
      @movies = MoviesFacade.searched_movies(params[:search])
    else
      @movies = MoviesFacade.top_rated_movies
    end
  end

  def show
    @movie = MoviesFacade.movie_details(params[:id])
  end

  # def show

  #   if params[:search]
  #     @movie = MoviesFacade.search_by_title.select { |movie| movie.id == (params[:id]) }
  #   else
  #     @movie = MoviesFacade.top_rated_movies.select { |movie| movie.id == (params[:id]) }
  #   end
  # end

end