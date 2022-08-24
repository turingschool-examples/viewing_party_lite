class MoviesController < ApplicationController

    def index 
        if params[:search].present?
            @results = MovieFacade.search_movies(params[:search])
            @search_term = params[:search]
        else 
            @results = MovieFacade.top_movies
        end
    end 

    def show 

    end 

    def search
        # @movie = MovieFacade.movie(params[:id])
    end
end