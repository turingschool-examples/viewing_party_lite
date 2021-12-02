class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    if (params[:q] == "top_rated")
        @movies = MovieFacade.popular_movies
        @title = "Top Movies"
    else
        @movies = MovieFacade.movie_search(params[:q])
        @title = "Movie Results For: #{params[:q]}"
    end
  end

  def show
    @movie = MovieFacade.movie_details(params[:movie_id])
    require "pry"; binding.pry
  end
end
