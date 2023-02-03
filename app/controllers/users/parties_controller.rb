class Users::PartiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @potential_guests = User.where.not(id: params[:user_id])
    @movie = MovieFacade.find_movie(params[:movie_id])
  end

  def create
    # binding.pry
  end

  private

  def create_user_viewing_party
    # binding.pry
  end
end