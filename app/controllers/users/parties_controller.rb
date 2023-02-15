class Users::PartiesController < ApplicationController
  def new
    if current_user
      @potential_guests = User.where.not(id: params[:user_id])
      @movie = MovieFacade.find_movie(params[:movie_id])
    else
      flash[:error] = 'Please log in to create a party'
      redirect_to movie_path(params[:movie_id])
    end
  end

  def create
    party = Party.new(party_params)
    if party.save
      party.create_parties(params, current_user)
      redirect_to user_path(current_user)
    else
      flash[:error] = 'Please fill in all fields accurately'
      redirect_to new_movie_party_path(params[:movie_id])
    end
  end

  private

  def party_params
    params.permit(:duration, :start_time, :movie_id)
  end
end
