class ViewingPartiesController < ApplicationController
  def new
    if Current.user
      @movie = MovieFacade.create_movie_details(params[:movie_id])
      @viewing_party = ViewingParty.new
      @all_users = User.all
    else
      redirect_to request.referrer
      flash[:alert] = 'Must be logged in or registered to create a movie party'
    end
  end

  def create
    viewing_party = ViewingParty.new(party_params)
    if viewing_party.save
      PartyUser.create({ user_id: Current.user.id, viewing_party_id: viewing_party.id,
                         host: true })
      PartyUser.invite_guests(params[:viewing_party][:invites], viewing_party.id)
      redirect_to dashboard_path
    end
  end

  private

  def party_params
    params.require(:viewing_party).permit(:duration, :date, :time, :movie_id)
  end
end
