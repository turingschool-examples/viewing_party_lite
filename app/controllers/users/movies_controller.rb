class Users::MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    if params[:q] == "top_rated"
      @movies = MovieFacade.top_rated_movies
    elsif params[:q] == "keyword"
      @movies = MovieFacade.keyword_search(params[:keyword])
    end
  end

  def show
  end
end
