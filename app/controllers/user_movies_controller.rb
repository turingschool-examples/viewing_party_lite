class UserMoviesController < ApplicationController
  def details
    @user = User.find(params[:id])
    if params[:q] == "top rated"
      @top_rated = TopRatedMovieService.movies["results"]
    elsif params[:search]
      @results = 'SOMERANDOMFUCKINGSHITSERVICE'
    end
  end
end