class UserMoviesController < ApplicationController
  def index
    # binding.pry
    # if params[:q] == top%40rated
    @movies = MovieFacade.top_40
    # else
    # @movie_search = MovieFacade.search_by_keyword
    # end 
  end
end
