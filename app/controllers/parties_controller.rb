class PartiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @movie = MovieFacade.movie_details(params[:movie_id])
    @users = User.all
  end

  def create

    user = User.find(params[:user_id])
    movie = MovieFacade.movie_details(params[:movie_id])
    start_time = ((params[:start_time] + " " + params[:day]).to_datetime).to_s
    @users = User.all
        require "pry"; binding.pry
    if params[:party_duration].to_i >= movie.runtime
      @party = Party.create(user_id: user.id, movie_id: movie.id, start_time: start_time, duration: params[:party_duration])
      redirect_to dashboard_path(user)
    else flash[:alert] = "That's not enough time for the movie. Give it more time!"
      redirect_to new_user_movie_party_path(user, movie.id)
    end
    if (@party and params[:party_invitees])

      params[:party_invitees].each do |invitee|
        UserParty.new(user_id: invitee.id, party_id: @party.id)
      end
    end

  end
end
