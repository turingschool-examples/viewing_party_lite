class UsersMoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    if params[:top_rated].present?
      @top_movies = TopRated.new.movies
      render 'users/movies/index'
    end

    render 'users/movies/index' #ok.
  end
end
