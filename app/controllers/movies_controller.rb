class MoviesController < ApplicationController 
  def index 
    @user = User.find(params[:user_id])
    if params[:search].present? 
      @movies = MovieFacade.movie_search(params[:search])
    elsif @movies = MovieFacade.create_top_movies
    else params[:search].blank? 
      redirect_to "/users/#{@user.id}/discover" 
    end
  end

  def show 
    @user = User.find(params[:user_id])
    @movie = MovieFacade.create_spec_movie(params[:id])
    @cast = MovieFacade.create_cast(params[:id])
    @reviews = MovieFacade.create_reviews(params[:id])
  end
end
