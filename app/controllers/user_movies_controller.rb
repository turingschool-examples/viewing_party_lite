class UserMoviesController < ApplicationController
  def discover
    @user = User.find(params[:id])
  end

  def results_top_rated
    @user = User.find(params[:id])
    facade = MovieFacade.new
    @movies = facade.find_top_rated_movies
    render 'results'
  end

  # def results_search
  #   @user = User.find(params[:id])
  #   require "pry"; binding.pry
  #   @movies = MovieFacade.new.search(params[:keyword])
  #   render 'results'
  # end

  #^method above, we could not get the params to pass to the controller

  def details
    @user = User.find(params[:id])
    @review_info = MovieFacade.new.reviews_info(params[:movie_id])
    @review_count = MovieFacade.new.review_count(params[:movie_id])
    @cast = MovieFacade.new.cast_members(params[:id])
  end
end
