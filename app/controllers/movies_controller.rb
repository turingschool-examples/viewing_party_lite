class MoviesController < ApplicationController
  def show
    @user = User.find(params[:id])
    @movie = MovieDbFacade.find_by_movie_id(params[:movie_id])
    @reviews_list = MovieDbFacade.reviews_by_movie(@movie.id)
    @cast_members = MovieDbFacade.cast(@movie.id)
  end

  def new
    @user = User.find(params[:id])
    @movie = Movie.find(params[:movie_id])
  end
end
