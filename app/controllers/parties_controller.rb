# frozen_string_literal: true

class PartiesController < ApplicationController
  before_action :find_host, only: %i[new create]
  before_action :find_movie, only: %i[new create]
  before_action :find_guests, only: [:new]

  def new; end

  def create
    movie = MovieFacade.movie_details(params[:movie_id])
    start_time = DateTime.new(params['start_time(1i)'].to_i, params['start_time(2i)'].to_i,
                              params['start_time(3i)'].to_i, params['start_time(4i)'].to_i, params['start_time(5i)'].to_i)
    party = Party.create!(duration: params[:duration], start_time: start_time, movie_id: movie.movie_id,
                          movie_title: movie.title)

    PartyUser.create!(party: party, user: @host, host: true)
    if params[:invited]
      params[:invited].select { |_k, v| v == '1' }.keys.each do |guest_id|
        PartyUser.create!(user_id: guest_id.to_i, party: party, host: false)
      end
    end

    redirect_to user_path(@host)
  end

  private

  def party_params
    params.permit(:movie_id, :movie_title, :start_time, :duration)
  end

  def find_host
    @host = User.find(params[:user_id])
  end

  def find_movie
    @movie = MovieFacade.movie_details(party_params[:movie_id])
  end

  def find_guests
    @guests = User.where('users.id != ?', params[:user_id])
  end
end
