class UserMoviesController < ApplicationController


  def show
    @user = User.find(params[:id])
    @movie = MovieService.movie_details(params[:movie_id])
    @reviews = MovieService.get_reviews(params[:movie_id])
    @cast = MovieService.get_cast(params[:movie_id])
  end

  def index
    @user = User.find(params[:id])
    if params[:q] == "top_40_movies"
      @movies = MovieService.top_40
    elsif !params[:find_movie].nil?
      @movies = MovieService.find(params[:find_movie].downcase)
    else
      redirect_to "/users/#{params[:id]}/discover"
      binding.pry
      # flash "please select a valid input"
    end
  end
end
