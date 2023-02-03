class ViewingPartiesController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    @vp = ViewingParty.find(params[:id])
  end

  def new
    @movie = MoviesFascade.find(params[:movie_id])
    @user = User.find(params[:user_id])
    @all_users = User.all
  end
  
  def create
    @movie = MoviesFascade.find(params[:movie_id])
    @user = User.find(params[:user_id])
    time = params["time(4i)"] + ":" + params["time(5i)"]
    vp = ViewingParty.create!(title: @movie.title, duration: params[:duration], start_time: time, host: @user.id)
    @all_users = User.all
    @all_users.each do |user|
      if params[user.name.to_sym] == "1"
        ViewingPartyUser.create!(viewing_party_id: vp.id, user_id: user.id)
      end
    end
    redirect_to "/users/#{@user.id}/movies/#{@movie.movie_id}/viewing_parties/#{vp.id}"
  end
end