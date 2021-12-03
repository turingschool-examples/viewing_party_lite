class PartiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @movie = MovieFacade.movie_details(params[:movie_id])
    @users = User.all
  end

  def create
    user = User.find(params[:user_id])
    movie = MovieFacade.movie_details(params[:movie_id])
    user1 = User.find(1)
    user2 = User.find(2)
    params[:party_invitees] = [user1, user2]
#probably don't need variable user and movie
    if params[:party_duration] >= movie.runtime
      @party = Party.create(user_id: user.id, movie_id: movie.id, start_time: params[:start_time], duration: params[:party_duration])
      redirect_to dashboard_path
    else flash[:not_enough_time] = "That's not enough time for the movie. Give it more time!"
      redirect_to new_user_movie_party_path
    end

    if @party & params[:party_invitees]
      params[:party_invitees].map do |invitee|
        UserParty.new(user_id: invitee.id, party_id: @party.id)
      end
    end
  end
end
