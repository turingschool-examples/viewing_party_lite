class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @movies = if params[:q]
      MovieFacade.popular_movies
    elsif params[:keyword]
      MovieFacade.movie_search
    else
      []
    end
  end

  def show
    @movie = MovieFacade.movie_details(params[:movie_id])
    require "pry"; binding.pry
  end
end
