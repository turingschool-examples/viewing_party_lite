class UsersController < ApplicationController
  before_action :set_user, only: [ :show, :discover, :results ]

  def set_user
    if session[:user_id]
      @user = User.find(session[:user_id])
    else
      flash[:error] = "Bad credentials, try again."
      redirect_to '/login'
    end
  end

  def welcome
  end

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to dashboard_path
      flash[:notice] = "Welcome #{@user.name}"
    elsif params[:password] != params[:password_confirmation]
      flash[:failure] = "Error: Password doesn't match."
      render :new
    else
      flash[:failure] = @user.errors.full_messages.first
      render :new
    end
  end

  def login_form
  end

  def login_user
    if !User.find_by(email: params[:email]).nil?
      @user = User.find_by(email: params[:email])
      if @user.authenticate(params[:password])
        session[:user_id] = @user.id
        flash[:success] = "Welcome, #{@user.name}!"
        redirect_to '/dashboard'
      else
        flash[:failure] = "Your passwords don't match our records"
        render :login_form
      end
    else
      flash[:failure] = "You are not a registered user."
      render :login_form
    end
  end

  def show
    if session[:user_id]
      flash[:success] = "Welcome, #{@user.name}!"
    end
  end

  def discover
    if session[:user_id]
    end
  end

  def results
    if session[:user_id]
      if params["q"] == "top rated"
        @movies = MovieFacade.get_top20_movies
      elsif params["Search by Movie Title"] != ""
        @movies = MovieFacade.get_movies(params["Search by Movie Title"])
      else
        flash.now[:alert] = "You must fill in a title."
        render :discover
      end
    end
  end

  private 
  def user_params
    params.permit(:email, :name, :password, :password_confirmation)
  end
end
