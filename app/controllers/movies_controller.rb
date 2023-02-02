class MoviesController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    @movie = MovieFacade.get_movie(params[:id])
    require 'pry'; binding.pry
    # @movie = Movie.find(params[:id])
  end
end