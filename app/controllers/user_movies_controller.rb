# require './app/facades/movie_facade'

class UserMoviesController < ApplicationController
  def details
    @user = User.find(params[:id])
    if params[:q] == "top rated"
      @top_rated = MovieFacade.top_rated
    
    elsif params[:search]
      @search_results = MovieFacade.movie_search(params[:search])
  
    end
  end

  
end