class PartiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @movie = MovieFacade.movie_info(params[:id])
    @all_user = User.all
    @party = Party.new(party_params.merge(host: @user.id, title: @movie.title, poster_path: @movie.poster_path, day: params[:day], start_time: params[:start_time]))
  end

  def create
    all_users = User.all
    user = User.find(params[:user_id])
    movie = MovieFacade.movie_info(params[:id])
    @party = Party.new(party_params.merge(host: user.id, title: movie.title, poster_path: movie.poster_path, day: params[:day], start_time: params[:start_time]))
    if @party.save
      UserParty.create(user_id: user.id, party_id: @party.id)

      @party.find_invitee(params).each do |guest|
        UserParty.create(user_id: guest.id, party_id: @party.id)
      end

      redirect_to "/users/#{user.id}"

    else
      render :new
    end
  end

  private

  def party_params
    params.permit(:host, :duration, :day, :start_time, :movie_id, :title, :poster_path, :user_ids)
  end
end
