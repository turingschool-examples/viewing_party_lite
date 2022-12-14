class UsersController < ApplicationController

  def new
    @user = User.new()
  end

  def create
    # user = user_params
    # user[:email] = user[:email].downcase
    # user = User.new(user)
    # session[:user_id] = user.id
    user = User.create(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.name}!"
      redirect_to "/users/#{user.id}"
    elsif
      flash[:alert] = user.errors.full_messages.to_sentence
      redirect_to '/register'
    end
  end

  def show

    @user = current_user

    @hosted = @user.hosted_parties
    @invited = @user.invited_parties
  end

  def discover
    @user = current_user
  end

  def login_form

  end

  def login_user
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:alert] = "Welcome, #{user.name}!"
      redirect_to dashboard_path
    else 
      flash[:error] = "Wrong Email/Password"
      redirect_to "/login" 
    end 
  end

  def logout_user
    session.destroy
    redirect_to "/"
  end

private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)

  end
end
