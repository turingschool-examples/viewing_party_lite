class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @movies = if params[:keyword]
                # DO Search
                MovieFacade.search(params[:keyword])
              else
                # Top Rated
                MovieFacade.top_movie
              end
  end
end
