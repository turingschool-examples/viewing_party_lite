class PartiesController < ApplicationController
  def new
    @user = User.find(session[:user_id])
    @users = User.where("users.id != ?", @user.id)
    @movie = MovieFacade.movie_details(params[:movie_id])
  end

  def create
    party = Party.create!(party_params)
    params[:invited].each do |user_id, value|
      PartyUser.create!(party_id: party.id, user_id: user_id) if value == "1"
    end

    if party.save
      redirect_to "/dashboard"
    else
      redirect_to "/movies/278/viewing-party/new"
      flash[:alert] = "Please Enter Valid Data."
    end
  end

  private

  def party_params
    params.permit(:date, :start_time, :duration, :host_id, :movie_id)
  end
end
