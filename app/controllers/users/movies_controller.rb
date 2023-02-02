class Users::MoviesController < ApplicationController
  
  def index
    @search_term = params[:title_search]

    if @search_term
      @movies = MovieFacade.new.search_movies(@search_term)
    else
      @movies = MovieFacade.new.get_top_movies
    end
    @user = User.find(params[:user_id])
  end

  def show
    @movie = MovieFacade.new(params[:id]).movie
    @user = User.find(params[:user_id])
  end
end

