class MoviesController < ApplicationController

   def index
      @user = User.find(params[:user_id])
      if params[:search] != nil
         @movies = MovieFacade.movies_keyword_query(params[:search])
      elsif
         @movies = MovieFacade.top_rated_movies
      end
   end

   def show
      @user = User.find(params[:user_id])
      @movie_details = MovieFacade.get_movie_details(params[:id])
      @movie_cast = MovieFacade.get_movie_cast(params[:id])
   end
end