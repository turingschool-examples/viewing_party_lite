class PartiesController < ApplicationController

  def new
    movie_facade = MovieFacade.new
    @movie = movie_facade.search_by_id(params[:id])
    @users = User.all
  end

  def create
    party = Party.create!(party_params)
    params[:invite_users].each do |user_id|
      UserParty.create!(user_id: user_id, party_id: party.id) if user_id != ""
    end

    redirect_to "/users/#{params[:user_id]}"
  end

private

  def party_params
    # params.permit(:id, :user_id, :start_time, :duration, :invite_users)
    {
      host_id: params[:user_id],
      date: params[:start_time],
      duration: params[:duration],
      movie_id: params[:id]
    }
  end
end
