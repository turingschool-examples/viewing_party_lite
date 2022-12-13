class ViewingPartiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @movie = MovieFacade.movie_search(params[:id])
    @user = User.all
  end

  def create
    ViewParties.new(viewing_party_params)
    @user = User.find(params[:user_id])
    @movie = MovieFacade.movie(params[:id])
  end

  private

  def viewing_party_params
    params.permit(:movie_id, :duration, :date, :movie_title)
  end
end
