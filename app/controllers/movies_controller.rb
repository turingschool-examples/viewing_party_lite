# frozen_string_literal: true

class MoviesController < ApplicationController
  def index
    @user = current_user
    @search = params[:search]

    if params[:top_rated]
      @movies = MoviesFacade.top_rated
    elsif @search.nil? || @search.strip.empty?
      flash[:alert] = "Error: Search field can't be blank"

      redirect_to discover_index_path(@user)
    else
      @movies = MoviesFacade.search(@search)
    end
  end

  def show
    @user = current_user

    @movie = MoviesFacade.get_movie_heavy(params[:id])
  end
end
