require './app/services/movies_service'

class MoviesController < ApplicationController
  def index
    @user = User.find(params[:id])
  
    data = MoviesService.new.search("top_rated")
    movies = data[:results][1..20]
    @top_20 = movies.pluck(:original_title, :id, :vote_average)
  end

  def show
    @user = User.find(params[:user_id])
    data = MoviesService.new.search(params[:id])
  end
end