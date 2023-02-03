class ViewingPartyController < ApplicationController
  def new
    @viewing_party = ViewingParty.new
    @user = User.find(params[:user_id])
    @users = User.where.not("id=#{params[:user_id]}")
    @movie = MovieFacade.all_movie_info(params[:movie_id])
  end

  def create
    # require 'pry', binding.pry
    viewing_party = ViewingParty.new(viewing_party_params)
    if viewing_party.save
      # UserViewingParty.create!(user_id: params[:user_id],
      #                          viewing_party_id: viewing_party.id,
      #                          status: "Hosting")
      # User.all.each do |user|
      #   if params[user.id.to_s]
      #     UserViewingParty.create!(user_id: user.id,
      #                             viewing_party_id: viewing_party.id,
      #                             status: "Invited")
      #   end
      # end
      redirect_to user_path(params[:id])
    end
  end

  private

  def viewing_party_params
    params.permit(:movie_id, :duration, :start_day, :start_time)
  end
end