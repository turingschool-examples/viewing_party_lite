class MoviesController < ApplicationController
    def index
      @user = User.find(params[:id])
      # facade = MovieFacade.new
      @movies = MovieFacade.top_movies
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
