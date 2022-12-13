class UsersController < ApplicationController
  def show 
    if user_in_session
      @user = User.find(user_in_session)
      @users = User.all
    else 
      redirect_to '/', notice: 'You must be logged in to access'
    end
  end

  def new 
    
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
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
        session[:user_id] = user.id
        redirect_to "/users/#{user.id}"
      else 
        flash[:error] = "Invalid login."
        redirect_to "/login" 
      end 
  end

  def logout
    session.delete :user_id
    redirect_to '/'
  end



  private
  def user_params 
    params.permit(:name, :email, :password, :password_confirmation)
  end
end