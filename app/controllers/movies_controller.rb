class MoviesController < ApplicationController
  def top_movies
    @movies = MovieFacade.new
  end

  def movie_details
    @movie = MovieFacade.new(params[:id])
    @movie_id = params[:id]
    @user = User.first
  end

  def top_movies 
     @movies = MovieFacade.new
  end

   def search_results 
     @movies = MovieFacade.new.search_results(params[:search])
   end
end