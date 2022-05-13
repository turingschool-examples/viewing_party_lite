class ViewingPartyController < ApplicationController
  def new 
  	@party = Party.new(party_params)
  end

  def create
  end

  private
  def party_params
  	params.permit(:movie_id, :duration, :data, :time)
  end
end