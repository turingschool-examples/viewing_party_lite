class MoviesController < ApplicationController
  def show
  end

  def discover
    @user = User.find(params[:id])
    redirect_to "users/#{@user.id}/movies"
  end

  def results
    @user = User.find(params[:id])
    if params[:q] == "top rated"
      @top_movies = MovieFacade.top_rated_movies
    elsif params[:keyword].present?
      @search_results = MovieFacade.search_movies(params[:keyword])
    end
  end
end
