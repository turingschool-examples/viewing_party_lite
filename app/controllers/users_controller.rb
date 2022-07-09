# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.create!(user_params)
    redirect_to user_path(user.id)
  end

  def show
    @user = User.find(params[:id])
  end

  def discover
    @user = User.find(params[:id])
  end

  def movies
    @user = User.find(params[:id])

    @movies = if params[:search].present?
                MovieFacade.movie_by_keyword(params[:search])
              else
                MovieFacade.top_20_movies
              end
  end

  def movie_details
    @user = User.find(params[:id])
    @movie = MovieFacade.movie_details(params[:movie_id])
    @cast = MovieFacade.movie_cast(params[:movie_id])
    @reviews = MovieFacade.movie_reviews(params[:movie_id])
  end

  private

  def user_params
    params.permit(:name, :email)
  end
end
