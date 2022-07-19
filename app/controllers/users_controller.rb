# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/users/dashboard'
      flash[:success] = "Welcome, #{user.name}"
    else
      flash[:error] = user.errors.full_messages
      redirect_to register_path
    end
  end

  def show
    if current_user
      @user = User.find(session[:user_id])
    else
      flash[:error] = "You must be logged in to access your dashboard"
      redirect_to root_path
    end
  end

  def discover
    @user = User.find(session[:user_id])
  end

  def movies
    @user = User.find(session[:user_id])

    @movies = if params[:search].present?
                MovieFacade.movie_by_keyword(params[:search])
              else
                MovieFacade.top_20_movies
              end
  end

  def movie_details
    # @user = User.find(session[:user_id])
    @movie = MovieFacade.movie_details(params[:movie_id])
    @cast = MovieFacade.movie_cast(params[:movie_id])
    @reviews = MovieFacade.movie_reviews(params[:movie_id])
  end

  def login_form
  end

  def login_user
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/users/dashboard'
      flash[:success] = "Welcome back, #{user.email}!"
    else
      redirect_to '/login'
      flash[:error] = 'Invalid Credentials'
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
