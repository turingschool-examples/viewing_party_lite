class ViewingPartyController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @uninvited = User.where.not(id: @user.id)
    @movie = TmdbFacade.details(params[:movie_id])
  end

  def create
    viewing_party = ViewingParty.new(party_params)
    movie = TmdbFacade.details(params[:movie_id])

    redirect_to user_path(params[:user_id]) if (viewing_party.length >= movie.total_min) & viewing_party.save
  end

  private

  def party_params
    params.permit(:date, :start_time, :length, :movie_id, :host_id)
  end
end
