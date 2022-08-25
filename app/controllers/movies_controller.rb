class MoviesController < ApplicationController

  def top_rated
    @search.top_rated
  end

  def keyword
   @search.keyword(params[:name])
  end

end
