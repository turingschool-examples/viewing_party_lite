class ViewingPartyController < ApplicationController
  before_action :find_user_and_movie, only: [:new]

  def new ; end

  private
  
  def find_user_and_movie
    @user = User.find(params[:user_id])
    @movie = MovieFacade.movie_id_search(params[:movie_id])
  end
end
