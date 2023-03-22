# frozen_string_literal: true

module Users
  class MoviesController < ApplicationController
    def index
      @search_term = params[:title_search]

      @movies = if @search_term
                  MovieFacade.new.search_movies(@search_term)
                else
                  MovieFacade.new.get_top_movies
                end
      @user = User.find(params[:user_id])
    end

    def show
      @movie = MovieFacade.new(params[:id]).movie
      @user = User.find(params[:user_id])
    end
  end
end
