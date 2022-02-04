class PartiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @movie = MovieFacade.movie_info(params[:id])
    @all_user = User.all
  end

  def create
    all_users = User.all
    user = User.find(params[:user_id])
    movie = MovieFacade.movie_info(params[:id])
    party = Party.create(party_params.merge(host: user.id, title: movie.title, poster_path: movie.poster_path, day: params[:day], start_time: params[:start_time]))

    UserParty.create(user_id: user.id, party_id: party.id)
    @params = params
      x = all_users.select do |user|
      @params.keys.include?(user.email)
    end

    x.each do |y|
      party[:host] = 2
      UserParty.create(user_id: y.id, party_id: party.id)
    end

    redirect_to "/users/#{user.id}"
  end

  private
  
  def party_params
    params.permit(:host, :duration, :day, :start_time, :movie_id, :title, :poster_path, :user_ids)
  end
end
