class UsersController < ApplicationController
  def new
  end

  def create 
    user = User.create(app_params)
    if user.valid?
      flash[:success] = "Welcome, #{user.name}"
      redirect_to user_path(user)
    else 
      flash[:alert] = "Error: #{error_message(user.errors)}"
      redirect_to register_path
    end
  end

  def show 
    @user = User.find(params[:id])
    @viewing_parties = @user.users_parties
  end
  def login_form
  end

  def login_user
    user = User.find_by(email: params[:email])
    if user
      if user.authenticate(params[:password])
        redirect_to "/users/#{user.id}"
      else
        redirect_to "/login"
        flash[:alert] = "Incorrect Password"
      end
    else
      redirect_to "/login"
      flash[:alert] = "Incorrect Email entered"
    end
  end

  private
  def app_params 
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
 
