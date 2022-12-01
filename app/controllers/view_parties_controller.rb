# frozen_string_literal: true

class ViewPartiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @movie = MovieFacade.new(params[:movie_id]).movie_by_id
  end

  def create
    user = User.find(params[:user_id])
    movie = MovieFacade.new(params[:movie_id]).movie_by_id
    params[:invite_users].shift
    invitees = User.find(params[:invite_users])
    new_party = ViewParty.new(view_party_params)

    if movie.minutes > params[:duration].to_i
      redirect_to new_user_movie_view_party_path(user, movie.id)
      flash[:alert] = 'Party duration cannot be shorter than the movie duration'
    elsif new_party.save
      UserViewParty.create(user_id: user.id, view_party_id: new_party.id, host: true)
      invitees.map { |invitee| invitee.view_parties << new_party }
      redirect_to user_path(user)
    else
      redirect_to new_user_movie_view_party_path(user, movie.id)
      flash[:alert] = new_party.errors.full_messages.to_sentence
    end
  end

  private

  def view_party_params
    params.permit(:movie_id, :movie_name, :duration, :datetime)
  end
end
