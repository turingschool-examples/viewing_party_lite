class ViewingpartiesController < ApplicationController

  def new 
    @movie = MovieFacade.service(params[:movie_id])  
    @users = User.all_without_current_user(params[:user_id])
  end

  def create  
    if params[:runtime].to_i < params[:movie_runtime].to_i
      redirect_to "/users/#{params[:user_id]}/movies/#{params[:movie_id]}/viewing-party/new", notice: "Error: Runtime must be longer than the movie length"
    elsif params[:date] == ""
      redirect_to "/users/#{params[:user_id]}/movies/#{params[:movie_id]}/viewing-party/new", notice: "Error: Date cannot be blank"
    elsif params[:time] == ""
      redirect_to "/users/#{params[:user_id]}/movies/#{params[:movie_id]}/viewing-party/new", notice: "Error: Time cannot be blank"
    else 
      date = DateTime.parse("#{params[:date]} #{params[:time]}")
      vp = ViewingParty.create!(start_time: date, party_duration_minutes: params[:runtime], movie_title: params[:movie_title], movie_duration_minutes: params[:runtime])
      ViewingPartyUser.create!(user_id: params[:user_id], viewing_party_id: vp.id, status: 1)
      if params[:user_ids] != nil 
        params[:user_ids].each do |id|
          ViewingPartyUser.create(user_id: id, viewing_party_id: vp.id, status: 0)
        end 
      end  
      redirect_to "/users/#{params[:user_id]}"
    end 
  end 

end