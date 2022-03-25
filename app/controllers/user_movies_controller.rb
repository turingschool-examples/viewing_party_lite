class UserMoviesController < ApplicationController
  def discover
    @user = User.find(params[:id])
  end

  def results
    @user = User.find(params[:id])
    if params[:top_rated_movies] == "top_rated"
      @top_rated = MovieFacade.find_top_rated_movies
      render 'results'
    elsif params[:search]
      @found_movies = MovieFacade.new.search(params[:search])
      render 'results'
    end
    require 'pry'; binding.pry
  end
  
  def details
    @user = User.find(params[:id])
    @review_info = MovieFacade.new.reviews_info(params[:movie_id])
    @review_count = MovieFacade.new.review_count(params[:movie_id])
    @cast = MovieFacade.new.cast_members(params[:id])
  end
end