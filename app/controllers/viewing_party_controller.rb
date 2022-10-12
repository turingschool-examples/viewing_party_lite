# frozen_string_literal: true

class ViewingPartyController < ApplicationController
  def new
    @viewing_party = ViewingParty.new
    @movie = MovieService.get_movie_by_id(params[:movie_id])
  end

  private

  def party_params
    params.permit(:movie_id, :user_id)
  end
end
