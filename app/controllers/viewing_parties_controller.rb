class ViewingPartiesController < ApplicationController
  before_action :require_user

  def new
    @attendees = User.where.not(id: params[:user_id])
    @movie = MovieFacade.movie_details(params[:movie_id])
  end

  def create
    viewing_party = ViewingParty.create!(
      poster_path: params[:poster_path],
      movie_name: params[:movie_name],
      movie_id: params[:movie_id].to_i,
      host_id: params[:host_id].to_i,
      duration: params[:duration].to_i,
      eventdate: Date.parse(params[:eventdate]),
      starttime: Time.parse(params[:starttime])
    )

    UserViewingParty.create!( user_id: current_user.id, viewing_party_id: viewing_party.id )

    if params[:attendee_ids]
      params[:attendee_ids].each do |attendee_id|
        UserViewingParty.create!( user_id: attendee_id.to_i, viewing_party_id: viewing_party.id )
      end
    end

    redirect_to dashboard_path
  end
end
