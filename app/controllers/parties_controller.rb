class PartiesController < ApplicationController
  def new
    if current_user
      @movie = MovieFacade.details(params[:id])
      @user = User.find(session[:user_id])
      @users = User.all
    else
      redirect_to "/movies/#{params[:id]}"
      flash[:login] = "You must be logged in to access the Dashboard."
    end
  end

  def create
    party = Party.new(
      event_date: Date.parse("#{params["event_date(1i)"]}/#{params["event_date(2i)"]}/#{params["event_date(3i)"]}"),
      duration: params[:duration],
      start_time: Time.parse("#{params["start_time(4i)"]}:#{params["start_time(5i)"]}"),
      user_id: session[:user_id],
      movie_id: params[:id],
      movie_duration: params[:runtime].to_i
    )
    if party.save
      Invitation.create!(user_id: party.user_id, party_id: party.id)
      params[:invited_users].each { |user_id| Invitation.create!(user_id: user_id, party_id: party.id) }
      redirect_to "/dashboard"
    else
      redirect_to "/movies/#{params[:id]}/parties/new"
      flash[:invalid_duration] = "Invalid Data: Duration must be greater than or equal to the movie's runtime."
    end
  end
end
