require './app/services/movies_service'

class MoviesController < ApplicationController
  def index
  
    @user = User.find(params[:id])
    if params[:q] == "top_rated"
      data = MoviesService.new.search("top_rated")
      movies = data[:results][1..20]
      @top_20_rated = movies.pluck(:original_title, :id, :vote_average)
    else
      params[:q]
      data = MoviesService.new.keyword_search(params[:q])
      movies = data[:results][1..20]
      @top_20_rated = movies.pluck(:original_title, :id, :vote_average)
    end
  end

  def show
    @user = User.find(params[:user_id])
    data = MoviesService.new.search(params[:id])
  end
end