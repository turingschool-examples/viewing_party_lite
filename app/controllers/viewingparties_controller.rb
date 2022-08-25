class ViewingpartiesController < ApplicationController

  def new 
    @movie = MovieFacade.service(params[:movie_id])  
    @users = User.all_without_current_user(params[:user_id])
  end

  def create 
    date = "#{params[:date]}#{params[:time]}"
    vp = ViewingParty.create(start_time: date, party_duration_minutes: params[:runtime], movie_title: params[:movie_title], movie_duration_minutes: params[:runtime])
    ViewingPartyUser.create(user_id: params[:user_id], viewing_party_id: vp.id, status: 1)
    if params[:user_ids] != nil 
      params[:user_ids].each do |id|
        ViewingPartyUser.create(user_id: id, viewing_party_id: vp.id, status: 0)
      end 
    end 
    redirect_to "/users/#{params[:user_id]}"
  end 

end