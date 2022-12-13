# frozen_string_literal: true

class ViewingPartiesController < ApplicationController
  before_action :require_host

  def new
    @guests = User.all.where.not(id: @host.id)
    @movie = MovieService.movie_by_id(params[:movie_id])
  end

  def create
    @guests = User.all.where.not(id: @host.id)
    movie = MovieService.movie_by_id(params[:movie_id])
    v_p = ViewingParty.new(viewing_party_params)
    if v_p.save
      ViewingPartyUser.create!(user_id: @host.id, viewing_party_id: v_p.id, host: 1)
      invitee_ids = params[:invited_to_party].drop(1)
      invitee_ids.each do |id|
        id = id.to_i
        ViewingPartyUser.create!(user_id: id, viewing_party_id: v_p.id)
      end
      redirect_to user_path(@host.id)

    elsif viewing_party_params[:date].blank? && viewing_party_params[:start_time].blank?
      redirect_to "/users/#{@host.id}/movies/#{movie[:id]}/viewing-party/new"
      flash[:alert] = '**Fields Cannot Be Blank**'
    elsif viewing_party_params[:date].blank?
      redirect_to "/users/#{@host.id}/movies/#{movie[:id]}/viewing-party/new"
      flash[:alert] = '**Date Cannot Be Blank**'
    elsif viewing_party_params[:start_time].blank?
      redirect_to "/users/#{@host.id}/movies/#{movie[:id]}/viewing-party/new"
      flash[:alert] = '**Start Time Cannot Be Blank**'
    end
  end

  private

  def viewing_party_params
    params.permit(:movie_id, :duration, :date, :start_time)
  end

  def require_host
    @host = User.find(params[:user_id])
    if @host.id != session[:user_id]
      redirect_to root_path
      flash[:error] = "You must be logged in or registered to create a movie party"
    end
  end
end
