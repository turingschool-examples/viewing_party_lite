class MoviesController < ApplicationController
  def index
    if params[:q] == "top%20rated"
      @top_20 = MovieFacade.top_20
    elsif params[:q]
      @search_results = MovieFacade.search_results(params[:q])
    end
  end

  def show
    @movie_details = {
      movie: MovieFacade.details(params[:id]),
      cast: MovieFacade.cast_members(params[:id]),
      reviews: MovieFacade.reviews(params[:id])
    }
  end
end
