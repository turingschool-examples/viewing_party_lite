class PartiesController < ApplicationController
  def new
    @users = User.all
    @user = User.find(params[:user_id])
    @movie = MovieFacade.movie_data(params[:movie_id])
    @movie_id = params[:movie_id]
  end

  def create
    @movie = MovieFacade.movie_data(params[:movie_id])
    party = Party.new(party_params)
    binding.pry
    params[:users].each do |user|
      this_user = User.find(user).id
      PartyUser.create(user_id: this_user, party: party)
    end
    redirect_to "/users/#{params[:user_id]}"
  end

private

  def party_params
    params.permit(:id, :duration, :date, :start_time, :user_id, :movie_id)
    end
end
