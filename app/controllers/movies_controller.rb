class MoviesController < ApplicationController 

    def top_movies 
        @movies = MovieFacade.new
    end
end