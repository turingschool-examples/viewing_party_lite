class ViewPartiesController < ApplicationController
  def new
    # binding.pry
    @users = User.where("id != ?", params[:user_id])
    @user = User.find(params[:user_id])
    movie_id = params[:movie_id]
    @movie = TMDBService.get_movie_by_id(movie_id)
    # binding.pry
    view_party = ViewParty.new
  end
end