class UsersController < ApplicationController

  def new
    @user = User.new 
  end 

  def create
    new_user = User.create(user_params)
    if new_user.save 
      redirect_to "/users/#{new_user.id}"
      flash[:success] = "Welcome, #{new_user.name}!"
    else 
      redirect_to "/register"
      flash[:error] = new_user.errors.full_messages
    end 
  end

  def show
    @user = User.find(params[:id])
    @hosts_parties = @user.hosting
  end

  def login_form 
  end 
  
  def login_user
    user = User.find_by(email: params[:email])
    flash[:success] = "Welcome, #{user.name}!"
    redirect_to "/users/#{user.id}"
  end 


  private

    def user_params
      params.permit(:name, :email, :password, :password_confirmation)
    end
end
