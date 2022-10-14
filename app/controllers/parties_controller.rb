class PartiesController < ApplicationController
  def new
    @movie = MovieFacade.movie_details(params[:movie_id])
    @user = User.find(params[:user_id])
    @users = User.all
  end

  def create
    @user = User.find(params[:user_id])
    movie = MovieFacade.movie_details(params[:movie_id])
    @party = Party.new(party_params)
    @users = User.all
    if @party.save
      @users.each do |user|
        if params["#{user.id}"] = 1
          UserParty.create!(user_id: user.id, party_id: @party.id)
        end
      end
      redirect_to(user_path(@user))
    # else
    #   redirect_to(new_user_movie_party_path(@user, movie.id))
    end
  end

  private

  def party_params
    params.permit(:duration, :date, :start_time, :host_id, :movie_id)
  end
end
