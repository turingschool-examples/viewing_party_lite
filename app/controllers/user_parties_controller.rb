class UserPartiesController < ApplicationController

  def new
    @user = User.find(params[:id])
    @movie = MovieFacade.movie_by_id(params[:movie_id])
  end

  def create
    @user = User.find(params[:id])
    party = Party.new(party_params)
    @movie = MovieFacade.movie_by_id(params[:movie_id])

    if @movie.runtime > party.duration
      redirect_to "/users/#{@user.id}/movies/#{@movie.id}/viewing-party/new"
      flash[:alert] = 'The duration can not be shorter than the run time of the movie, silly.'
    elsif party.save
      PartyMaker.make_party(@user.id, party.id, params[:invitees])
      redirect_to user_path(@user.id)
    else
      flash.now[:alert] = 'Please use a valid time and date'
      render :new
    end
  end

  private

  def party_params
    params.permit(:start_time, :duration, :date, :movie_id)
  end
end
