class ViewingPartiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @users = User.everyone_except(params[:user_id])
    @movie = MovieFacade.movie_info(params[:movie_id])
  end

  def create  
    movie = MovieFacade.movie_info(params[:movie_id])
    viewing_party = ViewingParty.new(movie_id: params[:movie_id], duration: params[:duration], date: params[:date], start_time: params[:start_time])
    if viewing_party.duration < movie.runtime
      flash[:alert] = "Error: Duration of the viewing party must be longer than the movie's runtime."
      redirect_to "/users/#{params[:user_id]}/movies/#{params[:movie_id]}/viewing-party/new"
    elsif viewing_party.save
      ViewingPartyUser.create!(user_id: params[:user_id], viewing_party_id: viewing_party.id, host: true) 
      params[:invited_user].each do |user|
        ViewingPartyUser.create!(user_id: user, viewing_party_id: viewing_party.id, host: false)
      end
      redirect_to "/users/#{params[:user_id]}"
    else
      flash[:alert] = "Error: #{error_message(user.errors)}"
      redirect_to "/users/#{params[:user_id]}/movies/#{params[:movie_id]}/viewing-party/new"
    end
  end
end