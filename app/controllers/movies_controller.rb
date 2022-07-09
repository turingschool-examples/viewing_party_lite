class MoviesController < ApplicationController
  before_action :find_user

  def index
    @movies = MovieFacade.movie_results(params[:search])
  end

  def show
    @movie = MovieFacade.create_single_movie(params[:movie_id])
    @credits = MovieFacade.create_single_movie_credits(params[:movie_id])
    @reviews = MovieFacade.create_single_movie_reviews(params[:movie_id])
    @image = MovieFacade.create_single_movie_images(params[:movie_id])
  end
end
