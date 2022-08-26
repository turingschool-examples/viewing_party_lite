class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    if params[:q] == 'top_rated'
      @top_20 = MovieFacade.top_20_rated
    else
      @query = params[:search]
      @search = MovieFacade.search(@query)
    end
    render "movies/index"
  end

  def show
    @movie = MovieFacade.movie_details(params[:id])
  end
end
