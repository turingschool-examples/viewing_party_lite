class MoviesController < ApplicationController

  def top_rated
    @user = User.find(params[:id])
    @movies = @search.top_rated(1).concat(@search.top_rated(2))
  end

  def keyword
   @user = User.find(params[:id])
   # binding.pry
   @movies = @search.keyword(params[:name], 1).concat(@search.keyword(params[:name], 2))
  end

  def show
    @user = User.find(params[:id])
    @movie = Movie.new(@search.find_movie_basic(params{:movie_id}), @search.find_movie_cast(params{:movie_id}), @search.find_movie_review(params{:movie_id}))
    end

end
