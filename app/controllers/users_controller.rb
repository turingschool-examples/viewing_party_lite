# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @parties = []
    Party.all.each do |party|
      party.attendees.each do |attendee|
        if party.user_id == @user.id || attendee.user_id == @user.id
          @parties << party
        end
      end 
    end 
    movie_ids = @parties.map { |party| party.movie_id }
    @movies = MovieFacade.multiple_movies(movie_ids)
  end

  def new; end

  def create
    if params[:password] == params[:password_confirmation]
      @user = User.create(new_user_params)
      if @user.save
        flash[:success] = "Welcome, #{@user.name}!"
        redirect_to "/users/#{@user.id}"
      else
        flash[:error] = "Something went wrong"
      end 
    else
      render :new
    end 
  end
    
  def discover
    @user = User.find(params[:id])
  end

  private

  def new_user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end

end
