class ViewingPartyController < ApplicationController
  before_action :set_user
  def new
    @party = Party.new(party_params)
    @movie = MovieFacade.movie_details(params[:movie_id])
    @users = User.all
  end

  def create
    @party = Party.create(party_proper_params)
    PartyUser.create(user_id: params[:user_id], party_id: @party.id, is_host: true)
    user_ids.each { |id| PartyUser.create(user_id: id, party_id: @party.id, is_host: false) }
  end

  private

  def party_params
    params.permit(:movie_id, :duration, :data, :time)
  end

  def party_proper_params
    party_params = {}
    party_params[:time] = time_format
    party_params[:movie_id] = params[:movie_id]
    party_params[:duration] = params[:duration]
    party_params
  end

  def time_format
    params['time(2i)'] = '0' + params['time(2i)'] if params['time(2i)'].length == 1
    time_string = params['time(1i)'] + params['time(2i)'] + params['time(3i)'] + params['time(4i)'] + params['time(3i)']
    Time.parse(time_string)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def user_ids
    params[:user_ids].map { |id| id.to_i }
  end
end
