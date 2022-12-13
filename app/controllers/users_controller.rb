class UsersController < ApplicationController
  def show 
    @user = User.find(params[:id])
  end

  def new 
    
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome, #{@user.email}!"
      redirect_to user_path(@user)
    else  
      flash[:error] = "Please Fill In Required Fields"
      redirect_to root_path
    end 
  end

  def login_form

  end

  def login_user 
    user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        redirect_to "/users/#{user.id}"
      else 
        flash[:error] = "Invalid login."
        redirect_to "/login" 
      end 
  end



  private
  def user_params 
    params.permit(:name, :email, :password, :password_confirmation)
  end
end