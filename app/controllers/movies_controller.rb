class MoviesController < ApplicationController
  def index
    if params[:title] != nil
      @movies = MovieFacade.search(params[:title])
      # require "pry"; binding.pry
    else
      @movies = MovieFacade.top_rated
    end

    @user = User.find(params[:user_id])
  end
end
