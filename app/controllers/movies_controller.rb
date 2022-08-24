class MoviesController < ApplicationController

    def index 

    end 

    def show 

    end 

    def search
        @movie = MovieFacade.movie(params[:id])
    end
end