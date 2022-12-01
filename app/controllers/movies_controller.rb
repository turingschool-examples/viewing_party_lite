class MoviesController < ApplicationController
  def discover
    @user = User.find(params[:id])
  end

  def index
    @user = User.find(params[:id])
    @movies = if params[:q] == 'top 20rated'
                MoviesSearch.new.top_rated_movies
              else
                MoviesSearch.new.movies_keyword(params[:q])
              end
  end
end
