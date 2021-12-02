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
end
