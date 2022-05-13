class PartiesController < ApplicationController
  def new
    @users = User.all
    @host = User.find(params[:user_id])
    @movie = MovieFacade.search_by_id(params[:movie_id])
  end

  def create
    host = User.find(params[:user_id])
    party = Party.create({host_id: host.id,
                        movie_id: params[:movie_id],
                        date: params[:date],
                        start_time: params[:start_time],
                        length: params[:length],
                        guests: params[:guests]})
    UserParty.create({user_id: host.id, party_id: party.id, host: true})
    if party[:guests]
      party[:guests].each do |guest|
        UserParty.create({user_id: guest, party_id: party.id, host: false})
      end
    end
    redirect_to "/users/#{host.id}"
  end

  private
    def party_params
      params.permit(:movie_id, :date, :start_time, :length, :host_id)
    end
end
