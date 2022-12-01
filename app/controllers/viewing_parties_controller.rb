class ViewingPartiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @movie = MovieDetailsSearch.new.movie(params[:movie_id])
    @users = User.where.not(id: params[:user_id])
  end

  def create
    user = User.find(params[:user_id])
    party = ViewingParty.create(app_params)
    UserViewingParty.create(user: user, viewing_party: party, status: 'Hosting')
    params[:invitees].each do |invitee|
      UserViewingParty.create(user_id: invitee, viewing_party: party, status: 'Invited')
    end
    redirect_to user_path(user)
  end

  private

  def app_params
    params.permit(:movie_title, :duration, :date, :start_time, :movie_id)
  end
end
