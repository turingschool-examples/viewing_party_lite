class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])

    if params[:q] == "top%20rated"
      @top_20 = MovieFacade.top_20
    elsif params[:q]
      @search_results = MovieFacade.search_results(params[:q])
    end
  end
end


# <a href="/users/:id/movies/#{@movie.id}"> @movie.name </a>
