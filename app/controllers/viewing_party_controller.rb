# frozen_string_literal: true

class ViewingPartyController < ApplicationController
  before_action :find_user_and_movie, only: [:new, :create]

  def new; end

  def create 
    @vp = ViewingParty.create!(movie_id: params[:movie_id], duration: params[:duration], date: params[:date], start_time: params[:start_time])
    redirect_to user_path(@user)
  end

  private

  def find_user_and_movie
    @user = User.find(params[:user_id])
    @movie = MovieFacade.movie_id_search(params[:movie_id])
  end
end
