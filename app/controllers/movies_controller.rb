class MoviesController < ApplicationController
    def index
      @user = User.find(params[:id])
      if params[:q] == "top rated"
        @movies = MovieFacade.top_movies
      else
        @movies = MovieFacade.search_movies(params[:movie_search])
      end
    end

    def discover
      @user = User.find(params[:id])
    end

    def search
        @movie = MovieFacade.search_movies(params[:search])
        @user = User.find(params[:id])
        render "movies/search"
    end
end
