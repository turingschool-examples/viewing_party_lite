class Users::MoviesController < ApplicationController
  def index
  end

  def show
  end

  def top_rated
    @movies = #MOVIES TOP 20 API CALL
    render :index
  end

  def keyword
    @movies = #MOVIES QUERY BY KEYWORD(params[:keyword])
    render :index
  end

end
