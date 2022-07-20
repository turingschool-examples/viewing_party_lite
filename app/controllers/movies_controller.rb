class MoviesController < ApplicationController
  def index
    if current_user
      @user = current_user
    else
      redirect_to login_path
    end
    
    if params[:search] && params[:search].blank?
      @movies = []
      flash[:error] = "0 Search Results"
    elsif params[:search]
      @movies = MovieFacade.new.search_movie(params[:search])
    else
      @movies = MovieFacade.new.return_top_40_movies
    end
  end

  def show
    if current_user
      @user = current_user
    else
      redirect_to login_path
    end
    @movie_details = MovieFacade.new.movie_details(params[:id])

  end
end
