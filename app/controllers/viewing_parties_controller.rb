require 'faraday'

class ViewingPartiesController < ApplicationController
  def new
    @movie = MovieService.movie_details(params[:movie_id])
    @user = User.find(params[:user_id])
  end

  def create
    user = User.find(params[:user_id])
    movie = MovieService.movie_details(params[:movie_id])
    viewing_party = ViewingParty.new(viewing_party_params.merge(title: movie.title, poster: movie.poster))
    if (viewing_party_params)[:duration_of_party].to_i < movie.runtime
      flash[:alert] = 'Viewing Party duration must be equal to or exceed movie runtime!'
      redirect_to "/users/#{user.id}/movies/#{movie.id}/viewing_parties/new"
    elsif viewing_party.save!
      UserParty.create!(user_id: user.id, viewing_party_id: viewing_party.id)
      redirect_to "/users/#{user.id}"
    else
      flash[:alert] = 'Please make sure all fields are filled in.'
      redirect_to "/users/#{user.id}/movies/#{movie.id}/viewing_parties/new"
    end
  end

  private

  def viewing_party_params
    params.permit(:user_id, :movie_id, :duration_of_party, :day, :start_time, user_ids: [])
  end
end
