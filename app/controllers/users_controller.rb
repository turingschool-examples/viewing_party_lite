class UsersController < ApplicationController
  before_action :find_user, only: [:show, :discover]

  def show
    @user = User.find(params[:id])
  end

  def new
  end


  def discover
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to "/users/#{@user.id}"
      flash[:success] = "Welcome, #{@user.name}!"
    else
      redirect_to "/register"
      flash[:error] = "#{@user.errors.full_messages}"
    end
  end

  # def login_form
  # end
  #
  # def login_user
  #   user = User.find_by(email: params[:email])
  #   if user&.authenticate(params[:password])
  #     session[:user_id] = user.id
  #     redirect_to "/users/#{user.id}"
  #     flash[:success] = "Welcome, #{user.name}!"
  #   else
  #     flash[:error] = "Sorry, your credentials are bad."
  #     render :login_form
  #   end
  # end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
