class MoviesController < ApplicationController
    def index
      @user = User.find(params[:user_id])
      if params[:q] == 'top%20rated'
        @movies = MoviesFacade.get_top_rated_movies
      else params[:q]
        @movies = MoviesFacade.get_movies_by_keyword(params[:q])
      end
    end

end
