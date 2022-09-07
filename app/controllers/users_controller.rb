class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
  end

  def create
    @user = User.create(user_params)
      if @user.save
        flash[:success] = "Welcome #{@user.name}"
        redirect_to user_path(@user.id)
      else
        redirect_to register_path
        flash[:alert] = @user.errors.full_messages.to_sentence
      end
  end

  def discover
    @user = User.find(params[:id])
  end

  def login_form
  end

  def login_user
    @user = User.find_by(email: params[:email])
      if @user&.authenticate(params[:password])
        flash[:success] = "Welcome #{@user.name}"
        redirect_to user_path(@user.id)
      else
        redirect_to root_path
        flash[:error] = 'Invalid credentials'
      end
  end

  private
    def user_params
      # params.require(:user).permit(:name, :email, :password, :password_confirmation)
      params.permit(:name, :email, :password, :password_confirmation)
    end
end
