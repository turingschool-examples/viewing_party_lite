class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    if params[:top_rated]
      @movies = MovieFacade.top_rated
    elsif params[:search]
      @movies = MovieFacade.movie_search
    end
  end

  def show
    @movie = Movie.get_data(params[:id])
  end
end
