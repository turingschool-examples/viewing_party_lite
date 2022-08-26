class MoviesController < ApplicationController 
    def index
        @user = User.find(params[:id])
    end 
 
    def search
        @movie = MovieFacade.search_movies(params[:search])
        @user = User.find(params[:id])
        render "movies/index"
    end

    def discover 
        @user = User.find(params[:id])
    end 
end 