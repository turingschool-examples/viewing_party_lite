# frozen_string_literal: true

class ViewPartiesController < ApplicationController
  def new
    @movie = MovieFacade.movie(params[:movie_id])
    @users = User.all
  end

  def create
    view_party = ViewParty.new(view_party_params)
    if view_party.save
      UserViewParty.create!(view_party_id: view_party.id, user_id: params[:user_id])
      User.all.each do |user|
        param_term = "user_#{user.id}"
        UserViewParty.create!(view_party_id: view_party.id, user_id: user.id) if params[param_term] == 'true'
      end
      redirect_to "/users/#{params[:user_id]}"
    else
      redirect_to "/users/#{params[:user_id]}/movies/#{params[:movie_id]}/view_parties/new"
      flash[:alert] = 'Error: Please fill in all fields.'

    end
  end

  private

  def view_party_params
    params.permit(:host_id, :movie_title, :party_duration, :event_date, :poster_path)
  end
end
