class Users::PartiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @potential_guests = User.where.not(id: params[:user_id])
    @movie = MovieFacade.find_movie(params[:movie_id])
  end

  def create
    party = Party.new(party_params)
    if party.save
      party.create_user_parties(user_party_params)
      redirect_to user_path(params[:user_id])
    else
      redirect_to new_user_movie_party_path(params[:user_id], params[:movie_id])
      flash[:error] = 'Please fill in all fields accurately'
    end
  end

  private

  def party_params
    params.permit(:duration, :start_time, :movie_id)
  end

  def user_party_params
    params.permit(:user_id, :party_id, :is_host)
  end
end
