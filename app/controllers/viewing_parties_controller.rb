class ViewingPartiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @movie = MovieFacade.create_movie_details(params[:movie_id])
    @viewing_party = ViewingParty.new
    @all_users = User.all
  end

  def create
    viewing_party = ViewingParty.new(party_params)
    if viewing_party.save
      PartyUser.create({ user_id: params[:user_id], viewing_party_id: viewing_party.id,
                         host: true })
      invite_guests(params[:viewing_party][:invites], viewing_party.id)
      redirect_to user_path(params[:user_id])
    else
      render :new
    end
  end

  def party_params
    params.require(:viewing_party).permit(:duration, :date, :time, :movie_id)
  end

  def invite_guests(list, viewing_party_id)
    list.each do |user_id|
      PartyUser.create({ user_id: user_id, viewing_party_id: viewing_party_id,
                         host: false })
    end
  end
end
