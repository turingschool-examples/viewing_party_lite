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
    @user = User.find(params[:user_id])
    @movie = MovieFacade.movie_details(params[:id])
    @cast = MovieFacade.cast(params[:id]).take(10)
    @reviews = MovieFacade.reviews(params[:id])

  end
end
