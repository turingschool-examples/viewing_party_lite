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

  def new
    @user = User.new
  end

  def create
    # binding.pry
    if params[:password] == params[:password_confirmation]
      @user = User.create(new_user_params)
    
      if @user.save
        flash[:success] = "Welcome, #{@user.name}!"
        redirect_to "/users/#{@user.id}"
      else
        flash[:error] = @user.errors.full_messages.join
        redirect_to "/register"    
        # render :new
      end 
    elsif new_user_params[:password] != new_user_params[:password_confirmation]
      flash[:error] = "Passwords do not match"
      redirect_to "/register"
      # render :new
    end 
  end
    
  def discover
    @user = User.find(params[:id])
  end

  def login_form
  end

  def login
    user = User.find_by(email: params[:email])
    if user.nil?
      # binding.pry
      flash[:error] = "Incorrect Email"
      render :login_form
    else
      if user.authenticate(params[:password])
        # binding.pry
        session[:user_id] = user.id
        flash[:success] = "Welcome #{user.name}!"
        redirect_to "/users/#{user.id}"
      else
      flash[:error] = "Incorrect Password"
      render :login_form
      end 
    end 
  end 
  

  private

  def new_user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
