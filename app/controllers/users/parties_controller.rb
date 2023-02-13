class Users::PartiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @potential_guests = User.where.not(id: params[:user_id])
    @movie = MovieFacade.find_movie(params[:movie_id])
  end

  def create
    potential_guests = User.where.not(id: params[:user_id])
    party = Party.new(party_params)

    create_user_parties(party, potential_guests)
  end

  private

  def create_user_parties(party, potential_guests)
    if party.save
      UserParty.create!(user_id: params[:user_id], party_id: party.id, is_host: true)

      potential_guests.each do |guest|
        UserParty.create!(user_id: guest.id, party_id: party.id, is_host: false) if params[guest.id.to_s.to_sym] == '1'
      end
      redirect_to user_path(params[:user_id])
    else
      redirect_to new_user_movie_party_path(params[:user_id], params[:movie_id])
      flash[:error] = 'Please fill in all fields accurately'
    end
  end

  def party_params
    params.permit(:duration, :start_time, :movie_id)
  end
end
