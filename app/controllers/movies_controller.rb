class MoviesController < ApplicationController
  def index
    @top_rated = TopRatedSearch.new.movie_list
  end

  def show
  end
end
