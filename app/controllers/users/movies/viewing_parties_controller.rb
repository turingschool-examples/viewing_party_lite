class Users::Movies::ViewingPartiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @guests = User.all_except(@user)
    @movie = MovieFacade.movie_details(params[:movie_id])
  end
  
  def create
    viewing_party = ViewingParty.new(viewing_party_params)

    if viewing_party.save
      create_viewing_party_users(viewing_party) if params[:guest_id]
      
      redirect_to user_path(params[:user_id])
    else
      flash[:alert] = "Error"
      redirect_to new_user_movie_viewing_party_path(params[:user_id], params[:movie_id])
    end
  end
  
  private
  def viewing_party_params
    params.permit(:duration, :user_id, :movie_id, :start_time, :day, :runtime, :title, :poster_path)
  end
  
  def create_viewing_party_users(viewing_party)
    params[:guest_id].each do |guest_id|
      ViewingPartyUser.create!(viewing_party_id: viewing_party.id, user_id: guest_id)
    end
  end
end