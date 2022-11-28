class MoviesController < ApplicationController
  before_action :find_user, only: [:index]

  def index
    if params[:search].present?
      @results = MovieFacade.create_search_movie(params[:search])
      if @results.empty?
          redirect_to "/users/#{@user.id}/discover"
      end
    else
        @results = MovieFacade.create_top_movies
    end
  end

  def show
   @movie = MovieFacade.create_find_movie(params[:id])
  end


end
