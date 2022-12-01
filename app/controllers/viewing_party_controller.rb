class ViewingPartyController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @users = User.all
    @movie = MovieFacade.find_movie(params[:movie_id])
  end
  def create
    user = User.find(params[:user_id])
    movie = MovieFacade.find_movie(params[:movie_id])
    viewing_party = ViewingParty.create!(movie_id: movie.id, movie_title: movie.title, date: params[:date], start_time: params[:time], duration: params[:duration])

    params[:users].each do |user_id|
      if user_id == params[:user_id]
        UserViewingParty.create!(user_id: user_id, viewing_party_id: viewing_party.id, host: true)
      else
        UserViewingParty.create!(user_id: user_id, viewing_party_id: viewing_party.id, host: false)
      end
    end

    redirect_to user_path(user.id)
    # require "pry"; binding.pxry
  end
end
