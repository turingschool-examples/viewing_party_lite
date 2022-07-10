class ViewPartiesController < ApplicationController
  def new
    @movie = MovieFacade.find_movie(params[:movie_id])
    @users = User.all
  end

  def create
    party = ViewParty.create!(
      movie_api_id: params[:movie_id],
      duration: params[:duration],
      date: params[:date],
      time: params[:time]
    )
    UserViewParty.create!(
      user_id: params[:user_id],
      view_party_id: party.id,
      host: true
    )
    if params[:invited].present?
      params[:invited].each do |invited_id|
        UserViewParty.create!(
          user_id: invited_id.to_i,
          view_party_id: party.id,
          host: false
        )
      end
    end
    redirect_to "/users/#{params[:user_id]}"
  end
end
