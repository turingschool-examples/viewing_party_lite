class MoviesController < ApplicationController
  before_action :save_movie, only: [:show]

  def show
    @user = User.find(params[:user_id])
    if params[:results] == 'true'
      @movie = MovieFacade.get_movie(params[:id])
      @cast = MovieFacade.get_10_cast(@movie.api_id)
      @reviews = MovieFacade.get_reviews(@movie.api_id)
    else
      @movie_db = Movie.find(params[:id])
      @movie = MovieFacade.get_movie(@movie_db.api_id)
      @cast = MovieFacade.get_10_cast(@movie_db.api_id)
      @reviews = MovieFacade.get_reviews(@movie_db.api_id)
    end
  end

  def index
    @user = User.find(params[:user_id])
    if params[:q] == 'top%20rated'
      @results = MovieFacade.top_twenty
    else
      @results = MovieFacade.search(params[:search])
      @search = params[:search]
    end
  end

  private

    def save_movie
      if Movie.find_by('api_id = ?', params[:id]) == nil
        Movie.create!(api_id: params[:id])
      end
    end
end
