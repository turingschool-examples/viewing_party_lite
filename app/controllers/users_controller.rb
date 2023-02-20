# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    if session[:user_id]
      @user = User.find(session[:user_id])
      @viewing_parties = @user.viewing_parties
      @parties_info = []
      @viewing_parties.each do |party|
        @parties_info << party.collect_display_data
      end
    else
      flash[:alert] = "You must be logged in or registered to access dashboard"
      redirect_to '/'
    end
  end

  def discover_movies
  end

  def new
    @user = User.new
  end

  def create
   user = User.new(user_params)
    if user.save(user_params)
      session[:user_id] = user.id
      flash.notice = 'User has been created!'
      redirect_to '/dashboard'
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
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      if user.admin?
        flash[:notice] = "Welcome to your Admin Dashboard, #{user.name}!"
        redirect_to '/admin/dashboard'
      else
        flash[:notice] = "Welcome, #{user.email}!"
        redirect_to '/dashboard'
      end
    else
      flash[:notice] = "Sorry, your credientials are bad."
      render :login_form
    end
  end

  def logout
    session.delete(:user_id)
    redirect_to root_path
  end

  private

  def user_params
    params[:email].downcase!
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
