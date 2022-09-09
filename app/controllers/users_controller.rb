class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
  end

  def create
    @user = User.create(user_params)
      if @user.save
        session[:user_id] = @user.id
        flash[:success] = "Welcome #{@user.name}!"
        redirect_to dashboard_path
      else
        redirect_to register_path
        flash[:alert] = @user.errors.full_messages.to_sentence
      end
  end

  private
    def user_params
      params.permit(:name, :email, :password, :password_confirmation)
    end
end
