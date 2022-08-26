class UserMoviesController < ApplicationController
    def index
        @user = User.find(params[:user_id])
        if params[:q] == 'top rated'
            @movies = MovieFacade.top_rated
        else
            @movies = MovieFacade.movie_search(params[:q])
        end
    end
end