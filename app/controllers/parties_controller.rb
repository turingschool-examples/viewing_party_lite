class PartiesController < ApplicationController
  def new
    @users = User.all
    @user = User.find(params[:user_id])
    @movie = MovieFacade.movie_data(params[:movie_id])
    @movie_id = params[:movie_id]
  end

  def create
    @movie = MovieFacade.movie_data(params[:movie_id])
    if @movie.runtime < params[:duration].to_i
      party = Party.create!(party_params)
      params[:users].each do |user|
        PartyUser.create(user_id: user, party: party)
      end
      redirect_to "/users/#{params[:user_id]}"
    end
  end

private

  def party_params
    params.permit(:id, :duration, :date, :start_time, :user_id, :movie_id, :movie_name)
    end
end
