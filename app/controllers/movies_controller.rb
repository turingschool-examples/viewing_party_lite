class MoviesController < ApplicationController
  def show
  end

  def search

  end

  def discover
    @user = User.find(params[:id])

    redirect_to "users/#{@user.id}/movies"
    # if params[:q] == "top rated"
    #   # redirect_to '/users/new'
    #   @top_movies = MovieFacade.top_rated_movies
    #   redirect_to "users/#{@user.id}/movies/results"
    # else
    #   redirect_to '/'
    # end

  end

  def results
    @user = User.find(params[:id])
    if params[:q] == "top rated"
      @top_movies = MovieFacade.top_rated_movies
    end
  end
end
