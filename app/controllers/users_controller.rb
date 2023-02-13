# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @viewing_parties = @user.viewing_parties
    @parties_info = []
    @viewing_parties.each do |party|
      @parties_info << party.collect_display_data
    end
  end

  def discover_movies
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
   user = User.new(user_params)
    if user.save(user_params)
      flash.notice = 'User has been created!'
      redirect_to user_path(user)
    else
      flash[:error] = user.errors.full_messages.to_sentence
      redirect_to register_path
    end
  end

  def login_form
    render :login_form 
  end

  def login
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      flash[:notice] = "Welcome, #{user.email}!"
      redirect_to user_path(user)
    else
      flash[:notice] = "Sorry, your credientials are bad."
      render :login_form
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
