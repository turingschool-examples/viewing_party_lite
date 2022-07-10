class ViewingPartiesController < ApplicationController
  def new
    @movie = MoviesFacade.movie(params[:movie_id])
    @all_users = User.all
    @user = User.find(params[:user_id])
  end

  def create
    movie = MoviesFacade.movie(params[:movie_id])
    if movie.minutes > params[:duration].to_i
      redirect_to new_user_movie_viewing_party_path(user_id: params[:user_id], movie_id: params[:movie_id])
      flash[:alert] = 'Error: Your movie is longer than the party time!'
    else
      party = Party.create!(movie_name: movie.title, movie_id: movie.movie_id, date: params[:date], start_time: params[:time],
                            duration: params[:duration])
      PartyUser.create!(party_id: party.id, user_id: params[:user_id], host: true)
      params[:invites].each do |invite|
        PartyUser.create!(party_id: party.id, user_id: invite, host: false)
      end
      redirect_to user_path(id: params[:user_id])
    end
  end

  def show; end
end
