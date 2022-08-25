class MoviesController < ApplicationController
  def discover
    @user = User.find(params[:id])
  end

  def show
  end

  def results
    if params[:q] == 'top rated' 
      json = MovieService.top_rated
      @movies = json[:results].map do 
        TopMovie.new(movie_data)
      end
    else
      # @facade = MovieFacade.search
    end
  end
end