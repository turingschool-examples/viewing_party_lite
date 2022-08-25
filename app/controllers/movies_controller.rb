class MoviesController < ApplicationController
   def index
      @user = User.find(params[:user_id])
      params[:query] == 'top_rated'
      @movies = MovieFacade.top_rated_movies
   end

   def show
      @user = User.find(params[:user_id])
      @movie_details = MovieFacade.get_movie_details(params[:id])
   end
end