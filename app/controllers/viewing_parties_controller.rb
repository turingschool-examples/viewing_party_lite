class ViewingPartiesController < ApplicationController
  def new
    @user = User.find(params[:id])
    @users = User.all
    @movie = MovieDBFacade.movie(params[:movie_id])
  end

  def create
    @user = User.find(params[:id])
    @user_added_to_party = User.find(params[:added_user_to_party])
    viewing_party = ViewingParty.new(date: params[:date], duration: params[:duration_of_party], start_time: params[:start_time], host_id: params[:id], movie_id: params[:movie_id])
    
    if viewing_party.save
      party_user_association = PartyUser.create!(user_id: @user.id, viewing_party_id: viewing_party.id)
      party_user_association = PartyUser.create!(user_id: @user_added_to_party.id, viewing_party_id: viewing_party.id)
      redirect_to "/users/#{@user.id}}"
    else
      redirect_to "/users/#{@user.id}/movies/320288/viewing-party/new"
      flash[:alert] = "Error: #{error_message(viewing_party.errors)}"
    end
  end

  private

  def viewing_party_params
    params.permit(:id, :date, :duration, :start_time, :host_id, :movie_id)
  end
end

