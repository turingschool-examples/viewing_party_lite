class ViewingPartiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @movie = MovieFacade.details(params[:movie_id])
    @users = User.all
  end

  def create
    @user = User.find(params[:user_id])
    @vp = ViewingParty.new(viewing_party_params)
    @users = User.all
    # binding.pry
    @movie = MovieFacade.details(params[:movie_id])

    if @vp.save
      uvp = UserViewingParty.create!(user_id: @user.id, viewing_party_id: @vp.id, host: true)
      attendees = User.where(id: params[:attendees].keys)
      
      attendees.each do |user|
        UserViewingParty.create!(user: user, viewing_party: @vp, host: false)
      end
      redirect_to user_path(@user)
    else
      flash[:alert] = 'Please fill in all details'
      # binding.pry
      redirect_to new_user_movie_viewing_party_path(@user, @movie.id)
    end
  end

  private
  def viewing_party_params
    params.permit(:duration, :date, :start_time, :movie_id)
  end
end