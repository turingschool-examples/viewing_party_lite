class Users::MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    if params[:q] == "top_rated"
      @movies = MovieFacade.top_rated_movies
    elsif params[:q] == ""
      flash[:alert] = "Error: Search must be specified"
      redirect_to user_discover_index_path(@user)
    else
      @movies = MovieFacade.keyword_search(params[:q])
    end
  end

  def show
  end
end
