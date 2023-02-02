class Users::ViewingPartiesController < ApplicationController
  def new
    @host = User.find(params[:user_id])
    @movie = MovieFacade.new(params[:movie_id]).movie
    @viewing_party = ViewingParty.new
  end

  private

  def viewing_party_params
    params.require(:viewing_party)
          .permit(
            :duration, 
            :date, 
            :start_time
          )
  end
end
