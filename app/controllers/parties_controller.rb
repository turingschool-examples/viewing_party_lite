class PartiesController < ApplicationController
  def new
    @movie = MovieFacade.details(params[:movie_id])
    @user = User.find(params[:user_id])
    @users = User.all
  end

  def create
    party = Party.new(
      event_date: Date.parse("#{params["event_date(1i)"]}/#{params["event_date(2i)"]}/#{params["event_date(3i)"]}"),
      duration: params[:duration],
      start_time: Time.parse("#{params["start_time(4i)"]}:#{params["start_time(5i)"]}"),
      user_id: params[:user_id],
      movie_id: params[:movie_id]
    )
    if party.save
      Invitation.create!(user_id: party.user_id, party_id: party.id)
      redirect_to "/users/#{party.user_id}"
    end
  end
end
