class PartiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @movie = MovieService.movie_info(params[:id])
  end

  def create
    user = User.find(params[:user_id])
    movie = MovieService.movie_info(params[:id])
    party = Party.create(party_params.merge(title: movie.title, poster_path: movie.poster_path, day: params[:day], start_time: params[:start_time]))

    UserParty.create(user_id: user.id, party_id: party.id)

    redirect_to "/users/#{user.id}"
  end

  private
  def party_params
    params.permit(:host_id, :duration, :day, :start_time, :movie_id, :title, :poster_path, :user_ids)
  end
end
