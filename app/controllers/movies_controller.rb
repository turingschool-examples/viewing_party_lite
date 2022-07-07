class MoviesController < ApplicationController
  def discover
    @user = User.find(params[:user_id])
  end

  def index
    @user = User.find(params[:user_id])

    @movies = if params[:q] == 'top20rated'

                MovieFacade.create_top_movies

              else
                MovieFacade.create_movie_search(params[:q])
              end
  end
end
