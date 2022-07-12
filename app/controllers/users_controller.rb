class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    if user.save
      flash[:alert] = 'Your account was created'
      redirect_to user_path(user.id)
    else
      flash[:alert] = "Error: #{error_message(user.errors)}"
      redirect_to register_path
    end
  end

  def show
    @user = User.find(params[:id])
    @my_hosting = Party.where(user_id: @user.id.to_s)
    @my_invitations = @user.parties
  end

  def login_user
    authenticate_user
  end

  def logout
    session[:user_id] = nil
    redirect_to login_path
  end

  def authenticate_user
    user = User.find_by(email: params[:email])
    if !user.nil? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      redirect_to '/login', alert: 'Invalid email/password'
    end
  end

  def authenticate_user_google
    auth_hash = request.env['omniauth.auth']
    user_email = auth_hash[:info][:email]
    user = User.find_by(email: user_email)
    if user
      user = User.find_by(email: auth_hash[:info][:email])
      session[:access_token] = auth_hash[:credentials][:token]
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      user = User.create!(name: auth_hash[:info][:name], email: user_email,
                          password_digest: auth_hash[:extra][:id_token])
      session[:access_token] = auth_hash[:credentials][:token]
      session[:user_id] = user.id
      redirect_to dashboard_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
