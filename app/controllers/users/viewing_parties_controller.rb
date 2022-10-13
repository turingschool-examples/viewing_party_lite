class Users::ViewingPartiesController < ApplicationController
  def new
    @users = User.all
    @user = User.find(params[:user_id]) 
    @movie = MoviesFacade.details(params[:movie_id])
  end

  def create
    @user = User.find(params[:user_id])
    @viewing_party = @user.viewing_parties.new(viewing_party_params)
    if params[:duration] >= params[:movie_duration] 
      if @viewing_party.save
      redirect_to user_path(@user)
      else
        redirect_to new_user_movie_viewing_party_path(@user, params[:movie_id])
        flash[:alert] = "Error: #{error_message(@viewing_party.errors)}"
      end
    else
      redirect_to new_user_movie_viewing_party_path(@user, params[:movie_id])
      flash[:alert] = "Error: Duration cannot be shorter than movie runtime"
    end
  end

  private

  def viewing_party_params
    params.permit(:duration, :start_time, :movie_id)
  end
end