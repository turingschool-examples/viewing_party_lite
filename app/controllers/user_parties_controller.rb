class UserPartiesController < ApplicationController

  def new
    @user = User.find(params[:id])
    @movie = MovieFacade.movie_by_id(params[:movie_id])
  end

  def create
    @user = User.find(params[:id])
    @party = Party.create!(party_params)
    @movie_party = UserParty.new(user_id: @user.id, party_id: @party.id, is_host: true)
    @movie = MovieFacade.movie_by_id(params[:movie_id])

    if @movie.runtime > @party.duration
      redirect_to "/users/#{@user.id}/movies/#{@movie.id}/viewing-party/new"
      flash[:alert] = 'The duration can not be shorter than the run time of the movie, silly.'
    else @movie_party.save
      redirect_to user_path(@user)
    end
  end

  private

  def party_params
    params.permit(:id, :start_time, :duration, :date, :movie_id)
  end
end
