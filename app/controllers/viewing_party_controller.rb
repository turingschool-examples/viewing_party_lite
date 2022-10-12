# frozen_string_literal: true

class ViewingPartyController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @viewing_party = ViewingParty.new
    @movie = MovieFacade.movie_search_by_id(params[:movie_id])
  end

  def create
    @viewing_party = ViewingParty.new
  end

  private

  def party_params
    params.permit(:movie_id, :user_id)
  end
end
