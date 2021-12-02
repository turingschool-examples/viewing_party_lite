require 'faraday'

class ViewingPartiesController < ApplicationController
  def new
    @movie = MovieService.movie_details(params[:movie_id])
    @user = User.find(params[:user_id])
  end

  # def show
  #   @viewing_party = ViewingParty.find(params[:id])
  # end

  def create
    user = User.find(params[:user_id])
    movie = MovieService.movie_details(params[:movie_id])
    viewing_party = ViewingParty.new(viewing_party_params.merge(title: movie.title, poster: movie.poster))
    if (viewing_party_params)[:duration_of_party].to_i < movie.runtime
      flash[:alert] = 'Viewing Party duration must be equal to or exceed movie runtime!'
      redirect_to "/users/#{user.id}/movies/#{movie.id}/viewing-party/new"
    elsif
      viewing_party.save
      UserParty.create!(user_id: user.id, viewing_party_id: viewing_party.id)
      redirect_to "/users/#{user.id}"
    else
      flash[:alert] = 'Viewing Party could not be created'
      redirect_to "/users/#{user.id}/movies/#{movie.id}/viewing-party/new"
    end
  end

  private

  def viewing_party_params
    params.permit(:user_id, :movie_id, :duration_of_party, :day, :start_time)
  end
end

# t.string "movie_name"
# t.integer "duration"
# t.time "start_time"
# t.bigint "user_id"
