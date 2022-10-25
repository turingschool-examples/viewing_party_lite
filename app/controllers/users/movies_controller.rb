module Users
  class MoviesController < ApplicationController
    before_action :require_user, :current_user

    def index
      if params[:top_rated]
        @movies = MoviesFacade.top_rated
      elsif params[:search]
        @movies = MoviesFacade.search(params[:search])
      end
    end

    def show
      @movie = MoviesFacade.details(params[:id])
    end
  end
end
