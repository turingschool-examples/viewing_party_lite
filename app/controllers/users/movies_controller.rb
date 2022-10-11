class Users::MoviesController < ApplicationController
  def index
    if params[:top_rated]
      @movies = MoviesFacade.top_rated
    elsif params[:search]

    else

    end
  end

  def top_rated

  end
end