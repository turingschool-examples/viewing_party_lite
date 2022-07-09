class PartiesController < ApplicationController

  def new 
    @user = User.find(params[:user_id])
    @users = User.all 
    @movie = MovieFacade.search_by_id(params[:movie_id])
  end

  def create 
    users = User.all
    host = User.find(params[:user_id])
    movie = MovieFacade.search_by_id(params[:movie_id])
    party = Party.create({ 
                          duration: params[:duration],
                          date: params[:date],
                          start_time: params[:start_time],
                          movie_id: movie.id,
                          movie_title: movie.title,
                          host: host.id 
                        })   
    users.each do |user|
      if user.id == host.id
        UserParty.create!(user_id: host.id, party_id: party.id)
      elsif params.keys.include?(user.name)
        UserParty.create!(user_id: user.id, party_id: party.id)
      end
    end
    redirect_to user_path(host.id) 
  end
end

