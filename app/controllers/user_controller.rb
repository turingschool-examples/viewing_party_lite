class UserController < ApplicationController
  def show
    @user = User.find(params[:id])
    @parties = ViewingParty.where(host_id: @user.id)
  end

  def new; end

  def create
    user = User.new(user_params)
    
    if user.save 
      redirect_to user_path(user.id)
    else 
      redirect_to register_path 
      flash[:alert] = user.errors.full_messages.join(" , ")
    end
  end

  def login_form; end

  def login 
    user = User.find_by(email: params[:email])
    
    if user == nil 
      flash[:error] = "Sorry your email does not belong to an existing user."
      return redirect_to '/login'
    end

    if user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.name}"
      redirect_to user_path(user)
    else 
      flash[:error] = "Sorry your email and/or password is incorrect."
      redirect_to '/login'
    end 
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
