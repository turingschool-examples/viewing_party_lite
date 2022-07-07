class MoviesController < ApplicationController
    def index
        if params[:search]
            @movies = MoviesFacade.get_movies_by_keyword(params[:search])
        else
            @movies = MoviesFacade.get_top_rated_movies
        end
    end
    
end