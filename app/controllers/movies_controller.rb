class MoviesController < ApplicationController
  def discover
    @user = User.find(params[:id])
  end

  def index
    @user = User.find(params[:id])
    if params[:q] != ""
      @movies = if params[:q] == 'top 20rated'
                  MoviesSearch.new.top_rated_movies
                else
                  MoviesSearch.new.movies_keyword(params[:q])
                end
      @keywords = params[:q]
    else 
      flash[:alert] = "Error: You must provide a query"
      redirect_to "/users/#{@user.id}/discover"
    end 
  end

  def show 
    @user = User.find(params[:user_id])
    @movie = MovieDetailsSearch.new.movie(params[:id])
    @cast_list = CastSearch.new.cast(params[:id])
    @reviews = ReviewSearch.new.reviews(params[:id])
  end
end
