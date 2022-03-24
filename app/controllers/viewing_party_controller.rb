class ViewingPartyController < ApplicationController
  before_action :find_user_and_movie, only: [:new]

  def new
    @movie = Movie.new(id: 22, title: 'Pirates of the Caribbean: The Curse of the Black Pearl', runtime: 102,
      vote_average: 10)
  end

  private
  
  def find_user_and_movie
    @user = User.find(params[:user_id])
    # @movie = Movie.find(params[:movie_id])
  end
end
