class PartiesController < ApplicationController

  def new
    @movie = MovieFacade.find_movie(params[:movie_id])
    @users = User.all
  end

  def create
    party = Party.create(movie_id: params[:movie_id], duration: params[:duration], date: params[:date], start_time: params[:start_time])
    UserParty.create(party_id: party.id, user_id: (params[:user_id]), user_status: 0)
    if params[:added_users].present?
      params[:added_users].each do |user_id|
        UserParty.create(party_id: party.id, user_id: user_id, user_status: 1)
      end

    end
    redirect_to "/users/#{params[:user_id]}"
    flash[:alert] = "Party successfully created"
  end


end
