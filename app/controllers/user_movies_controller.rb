class UserMoviesController < ApplicationController
  def index
    if params[:q] == "top 20rated"
      @movies = MovieFacade.top_40
    elsif params[:q] == ""
      redirect_to "/users/#{params[:user_id]}/discover", notice: "Search cannot be blank."
    else
      @search_movies = MovieFacade.search_by_keyword(params[:q])
    end
  end

  def show
    @movie = MovieFacade.find_movie(params[:id])
    @cast = MovieFacade.find_cast(params[:id])
    @review = MovieFacade.find_review(params[:id])
  end
end
