# frozen_string_literal: true

class MoviesController < ApplicationController
  def index
    @movies = if params[:search]
                MovieFacade.get_movie_search_facade(params[:search])
              else
                MovieFacade.get_top_movies
              end

    @user = User.find(params[:user_id])
  end
end
