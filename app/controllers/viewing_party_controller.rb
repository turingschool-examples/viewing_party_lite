# frozen_string_literal: true

class ViewingPartyController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @viewing_party = ViewingParty.new
    @movie = MovieFacade.create_individual_movie(params[:movie_id])
    @users = User.other_users(@user)
  end

  def create
    @viewing_party = ViewingParty.new
  end
end
