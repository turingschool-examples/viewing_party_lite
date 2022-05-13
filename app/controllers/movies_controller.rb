class MoviesController < ApplicationController 

    def top_movies 
        @movies = MovieFacade.new
    end

    def search_results 
        @movies = MovieFacade.new.search_results(params[:search])
    end
end