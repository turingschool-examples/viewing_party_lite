# frozen_string_literal: true

class MoviesController < ApplicationController
  before_action :require_user

  def show
    @movie = MovieService.movie_by_id(params[:movie_id])
    @cast = MovieService.first_ten_cast(params[:movie_id])
    @reviews = MovieService.movie_reviews(params[:movie_id])
  end

  private

  def require_user
    @user = User.find(params[:user_id])
    return unless @user.id != session[:user_id]

    redirect_to root_path
    flash[:error] = 'You must be logged in or registered to access that page'
  end
end
