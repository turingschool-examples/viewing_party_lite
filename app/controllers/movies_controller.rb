class MoviesController < ApplicationController
  def index
    @top_rated = TopRatedSearch.new.movie_list
    require 'pry'; binding.pry
  end

  def show
  end
end
