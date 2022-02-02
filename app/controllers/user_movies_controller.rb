class UserMoviesController < ApplicationController

  def index
    @query = params[:query]
    @user = User.find(params[:id])
    @top_movies = MovieService.top_movies
  end

  def search
      @user = User.find(params[:id])
      @movies = MovieService.search_for_movie(params[:search])
      @search = params[:search]
      
      render :index
    end
  end
