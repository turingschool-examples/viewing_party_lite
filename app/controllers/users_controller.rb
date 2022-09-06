
class UsersController < ApplicationController 
  def new 
    @user = User.new
  end

  def show 
    @user = User.find(params[:id])
  end

  def create 
    # user = User.find_by_email(params[:email])
    new_user = User.create(user_params)
    if new_user.save 
      redirect_to "/users/#{new_user.id}"
      flash[:success] = "Welcome, #{new_user.email}!"
    else
      redirect_to "/register"
      flash[:error] = new_user.errors.full_messages
    end
  end

  def login 
    user = User.find_by(params[:email])
    if user.authenticate(params[:password])
      session[:user_id] = user.id 
      flash[:success] = "Welcome, #{user.email!}"
    else
      flash[:error] = "Sorry, your credentials are bad"
      render :login_form 
    end
  end

  def discover
    @user = User.find(params[:id])
  end

private 
def user_params 
    params.permit(:name, :email, :password)
end
end
