class UsersController < ApplicationController
  # before_action :authorized, only: [:show]

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @invitations = @user.invitations
    @host_parties = @user.is_host
    @not_hosted_movies = @user.invitations.map do |party|
      MovieFacade.new.details(party.movie_id)
    end
    @hosted_movies = @user.is_host.map do |party|
      MovieFacade.new.details(party.movie_id)
    end
  end

  def create
    @user = User.create(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render 'new'
    end
  end

  def discover
    @user = User.find(params[:id])
  end

  def login
  end 

  def logout
    session[:user_id] = nil 
    redirect_to login_path 
  end

  def authenticate_user
    user = User.find_by(email: params[:email])
    if user != nil && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else 
      flash[:error] = 'Invalid email/password'
      render 'login'
    end 
  end 


private
  def user_params
    params.require(:user).permit(:name, :email, :password, :passoword_digest)
  end
end
