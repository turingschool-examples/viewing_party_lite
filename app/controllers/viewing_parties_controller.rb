class ViewingPartiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @users = User.everyone_except(params[:user_id])
    @movie = MovieFacade.movie_info(params[:movie_id])
  end

  def create
    viewing_party = ViewingParty.new(movie_id: params[:movie_id], duration: params[:duration], date: params[:date], start_time: params[:start_time])
    require 'pry'; binding.pry 
    if viewing_party.save
      redirect_to "/users/#{params[:user_id]}"
    else
      flash[:alert] = "Error: #{error_message(user.errors)}"
      redirect_to "/users/#{params[:user_id]}/movies/#{params[:movie_id]}/viewing-party/new"
    end
  end
end