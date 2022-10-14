class ViewingPartyController < ApplicationController
  def new
    @movie = MovieFacade.movie_details(params[:movie_id])
    @user = User.find(params[:user_id])
    @users = User.all
  end

  def create
    user = User.find(params[:user_id])
    movie = MovieFacade.movie_details(params[:movie_id])

    @party = Party.new(party_params)
    require 'pry'; binding.pry
    if @party.save 
      flash.notice = "Party was successfully added!"
      redirect_to(user_path(user))
    else
      flash.alert = "ERROR not saved!"
      redirect_to(new_user_movie_viewing_party_path(user, movie.id))
    end
  end

  private

  def party_params
    params.require(:party).permit(:duration, :date, :start_time)
  end
end
