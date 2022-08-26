class MoviesController < ApplicationController

  def index
    @user = User.find(params[:id])
    if params[:top] == "top_rated"
      @movies = @search.top_rated(1).concat(@search.top_rated(2))
    else
      @movies = @search.keyword(params[:name], 1).concat(@search.keyword(params[:name], 2))
    end
  end

  def show
    @user = User.find(params[:user_id])
    @movie = Movie.new(@search.find_movie_basic(params[:id]), @search.find_movie_cast(params[:id]), @search.find_movie_review(params[:id]))
    end

end
