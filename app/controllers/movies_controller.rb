class MoviesController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :set_movie, only: [:show]
  before_action :get_cast, only: [:show]
  before_action :get_reviews, only: [:show]

  def show;end

  def index
   if params[:q] == 'top%20rated'
     @results = MovieFacade.top_twenty
    else
     @results = MovieFacade.search(params[:search])
   end
  end
  
  private
    def set_user
      @user = User.find(params[:user_id])
    end

    def set_movie
      @movie_db = Movie.find(params[:id])
      @movie = MovieFacade.get_movie(@movie_db.api_id)
    end

    def get_cast
      @cast = MovieFacade.get_10_cast(@movie_db.api_id)
    end

    def get_reviews
      @reviews = MovieFacade.get_reviews(@movie_db.api_id)
    end
end
