# frozen_string_literal: true

class UsersController < ApplicationController

  before_action :require_user, only: [:show]

  def show
    @viewing_parties = @user.viewing_parties
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user)
    elsif user_params[:password] != user_params[:password_confirmation]
      redirect_to '/register'
      flash[:alert] = 'ERROR: Password Confirmation does not match Password'
    elsif user_params[:name].blank? && !user_params[:email].blank?
      redirect_to '/register'
      flash[:alert] = 'ERROR: Please enter a valid name'
    elsif !user_params[:name].blank? && user_params[:email].blank?
      redirect_to '/register'
      flash[:alert] = 'ERROR: Please enter a valid email'
    elsif user_params[:name].blank? && user_params[:email].blank?
      redirect_to '/register'
      flash[:alert] = 'ERROR: Please enter a valid name and email'
    elsif !user_params[:name].blank? && user.errors[:email]
      redirect_to '/register'
      flash[:alert] = 'ERROR: Email already in use. Please enter a different email'
    end
  end

  def discover
    @user = User.find(params[:id])
  end

  def results
    @user = User.find(params[:user_id])

    @movies = if params['Find Movies'].present?
                MovieService.movies_by_keyword(params['Find Movies'])
              else
                MovieService.find_top_rated_movies
              end
  end

  def login_form
  end

  def login_user
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
        # binding.pry
      flash[:success] = "Welcome, #{user.email}"
      redirect_to "/users/#{user.id}"
    else
      flash[:error] = "Bad Credentials, try again."
      redirect_to "/login"
    end
  end

  def logout_user
    session.delete(:user_id)
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def require_user
    @user = User.find(params[:id])
    if @user.id != session[:user_id]
      redirect_to root_path
      flash[:error] = "You must be registered to access that page"
    end
  end
end
