class UserPartiesController < ApplicationController

  def new
    @user = User.find(params[:id])
    @movie = MovieFacade.movie_by_id(params[:movie_id])
  end

  def create
    @user = User.find(params[:id])
    @party = Party.new(party_params)
    @movie = MovieFacade.movie_by_id(params[:movie_id])
    
    if @movie.runtime > @party.duration
      redirect_to "/users/#{@user.id}/movies/#{@movie.id}/viewing-party/new"
      flash[:alert] = 'The duration can not be shorter than the run time of the movie, silly.'
    elsif @party.save
      @movie_party = UserParty.create!(user_id: @user.id, party_id: @party.id, is_host: true)
      params[:invitees].each do |invited_user_id|
        if invited_user_id != ""
          UserParty.create!(user_id: invited_user_id, party_id: @party.id, is_host: false)
        end
      end
      redirect_to user_path(@user)
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
