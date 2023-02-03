class Users::ViewingPartyController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @users = User.all
    @movie = MovieFacade.details("/3/movie/#{params[:movie_id]}", { api_key: ENV['tmdb_api_key'],
                                                                    language: 'en', 
                                                                    movie_id: params[:movie_id] })
    @viewing_party = ViewingParty.new
  end

  def create
    @viewing_party = ViewingParty.new(new_viewing_party_params)
    @user = User.find(params[:user_id])
    if @viewing_party.save
      binding.pry
      redirect_to user_path(@user)
    else
      flash[:error] = @viewing_party.errors.full_messages
      redirect_to new_user_movie_viewing_party_path(@user, params[:movie_id])
    end
  end

  private

  def new_viewing_party_params
    params[:movie_api_id] = params[:movie_id]
    params[:host_id] = params[:user_id]
    params.permit(:movie_api_id, :host_id, :duration, :date, :start_time)
  end
end