class MoviesController < ApplicationController
  def index
    if params[:q] == "top-rated"
      @top_movies = MovieFacade.top_rated
    elsif params[:q]
      @searched_movies = MovieFacade.search(params[:q])
    end
    @user = User.find(params[:user_id])
  end

  def show

  end
end
