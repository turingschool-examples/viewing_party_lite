class UsersController < ApplicationController
  def create
    new_user = User.create(user_params)
    if new_user.save
      redirect_to "/users/#{new_user.id}"
      flash[:success] = "Welcome, #{new_user.name}!"
    else
      flash[:error] = new_user.errors.full_messages
      redirect_to "/register"
    end
  end

  def show
    @user = User.find(params[:id])
    @hosts_parties = @user.hosting
  end

  def new
    @user = User.new
  end

  def login_form
  end

  def login_user
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.name}!"
      redirect_to "/users/#{user.id}"
    else
      flash[:error] = "Sorry, your credentials are bad."
      render :login_form
    end
  end


  private

    def user_params
      params.permit(:name, :email, :password, :password_confirmation)
    end
end
