class ViewingPartyController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @movie = MovieService.movie_info(params[:id])
  end
end
