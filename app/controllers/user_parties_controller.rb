class UserPartiesController < ApplicationController

  def new
    if session[:user_id]
      @user = User.find(session[:user_id])
      @movie = MovieFacade.movie_by_id(params[:movie_id])
    end
  end

  def create
    if session[:user_id]
      @user = User.find(session[:user_id])
      party = Party.new(party_params)
      @movie = MovieFacade.movie_by_id(params[:movie_id])

      if @movie.runtime > party.duration
        redirect_to "/users/#{@user.id}/movies/#{@movie.id}/viewing-party/new"
        flash[:alert] = 'The duration can not be shorter than the run time of the movie, silly.'
      elsif party.save
        PartyMaker.make_party(@user.id, party.id, params[:invitees])
        redirect_to dashboard_path
      else
        flash.now[:alert] = 'Please use a valid time and date'
        render :new
      end
    end
  end

  private

  def party_params
    params.permit(:start_time, :duration, :date, :movie_id)
  end
end
