# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :find_user, only: %i[discover show]

  def discover; end

  def login_form; end

  def login
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
      flash[:success] = "Welcome, #{user.name}!"
    else
      flash[:error] = 'Sorry, your credentials do not match.'
      redirect_to login_path
    end
  end

  def new; end

  def show
    @view_parties = @user.view_parties.order('datetime')
  end

  def create
    new_user = User.new(user_params)

    if new_user.save
      redirect_to user_path(new_user)
      flash[:success] = "Welcome, #{new_user.name}!"
    else
      redirect_to register_path
      flash[:alert] = new_user.errors.full_messages.to_sentence
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
