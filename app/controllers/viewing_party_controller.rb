class ViewingPartyController < ApplicationController 
  def new
    @user = User.find(params[:user_id])
    @movie = MovieFacade.movie_data(params[:movie_id])
    @party = Party.new
    @users = User.all.where.not(id: params[:user_id])
  end

  def create
    user = User.find(params[:user_id])
    movie = MovieFacade.movie_data(params[:movie_id])

    party = Party.new(party_params)
    users = User.all.where.not(id: params[:user_id])
    if party.save
      users.each do |user|
        UserParty.create(party_id: party.id, user_id: user_params[:"#{user.name}"]) if user_params[:"#{user.name}"] != " "
      end
      UserParty.create(party_id: party.id, user_id: params[:user_id])
      redirect_to user_path(user)
    else
      flash.alert = party.errors.full_messages.to_sentence
      redirect_to new_user_movie_viewing_party_path(user, movie.id)
    end
  end


  private

  def user_params 
    users = User.all.where.not(id: params[:user_id])
    user_names = users.map{|user| user.name}
    params.permit(user_names)
  end

  def party_params
    params.permit(:movie_id, :duration, :date, :start_time, :host_id, :movie_runtime)
  end
end