class ViewPartiesController < ApplicationController
  def new
    @users = User.where("id != ?", params[:user_id])
    @user = User.find(params[:user_id])
    movie_id = params[:movie_id]
    @movie = TMDBService.get_movie_by_id(movie_id)
    view_party = ViewParty.new
  end

  def create
    user = User.find(params[:user_id])
    movie_id = params[:movie_id]
    # binding.pry
    view_party = user.view_parties.new(new_view_party_params)
    # binding.pry
    if view_party.save
      binding.pry
      # params_checkboxes.map do |details|
      #   view_party.guest_parties.new(details)
      # end
      redirect_to user_path(user.id)
    else
      redirect_to new_user_movie_view_party_path(user.id, movie_id), notice: "Invalid input"
    end
  end

  private
  def new_view_party_params
    params.permit(:duration, :date, :time, :movie_id)
  end
end