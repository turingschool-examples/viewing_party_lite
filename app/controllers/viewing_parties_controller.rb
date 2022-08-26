class ViewingPartiesController < ApplicationController

  def new
    @users = User.all
    @movie = MovieFacade.find_movie_details(params[:movie_id])
  end

  def create
    invited = []
    params.each do |k,v|
      if k.to_i != 0 && v == '1'
        invited << k
      end
    end

    party = Party.create!(date: params[:date], start_time: params[:start_time], movie_id: params[:movie_id])
    test = UserParty.create!(user_id: params[:user_id], party_id: party.id, host: true)

    invited.each do |id|
      UserParty.create!(user_id: id.to_i, party_id: party.id, host: false)
    end

    redirect_to "/users/#{params[:user_id]}"
  end

end
