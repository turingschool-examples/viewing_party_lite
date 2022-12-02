class PartiesController < ApplicationController
  def new
    movie_search = MovieSearch.new
    @movie = movie_search.retrieve_movie(params[:movie_id])
    user = User.find(params[:user_id])
    @other_users = user.other_users
  end

  def create
    @movie = MovieSearch.new.retrieve_movie(params[:id])
  end
end
