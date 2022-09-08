class MoviesController < ApplicationController
    def index
        @user = User.find(params[:user_id])
        if params[:q] == 'top rated'
            @movies = MovieFacade.top_rated
        else
            @movies = MovieFacade.movie_search(params[:q])
        end
    end
    
    def show
        @user = User.find(params[:user_id])
        # binding.pry
        @movie = MovieFacade.movie_id(params[:movie_id])
        @cast = MovieFacade.first_10_cast(params[:movie_id])
    end
end