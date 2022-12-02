class MoviesController < ApplicationController

  def index
    if (params[:q] == 'top rated' && !params[:commit].present?) || params[:q] == ''
      @movies = MovieFacade.top_rated
      @subtitle = 'Top Rated Movies'
    elsif params[:q].present?
      @movies = MovieFacade.search(params[:q])
      @subtitle = "Movie results for: '#{params[:q]}'"
    else
      redirect_to discover_path(@user)
      flash[:alert] = 'Something went wrong, please try again'
    end
  end
end