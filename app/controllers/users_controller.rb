class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @parties_invited_to = @user.parties_invited_to
    @parties_hosting = @user.parties_hosting
  end

  def new; end

  def create
    @new_user = User.new(user_params)
    if @new_user.save
      flash[:success] = "Welcome #{@new_user.name}!"
      redirect_to root_path
    else
      redirect_to '/register'
    end
  end

  def login_form; end

  def login
    user = User.find_by(name: params[:name])

    if user && user.authenticate(params[:password]) && user.authenticate(params[:password_confirmation])
      session[:user_id] = user.id
      flash[:success] = "Welcome #{user.name}!"
      redirect_to root_path
    elsif params[:name] == ""
      flash[:error] = "Please enter name"
      render :login_form
    elsif params[:email] == ""
      flash[:error] = "Please enter email"
      render :login_form
    else
      flash[:error] = "Wrong password"
      render :login_form
    end
  end

  # def login
  #   user = User.find_by(name: params[:name])

  #   if user && user.authenticate(params[:password])
  #     if user.admin?
  #       redirect_to admin_dashboard_path
  #     elsif user.manager?
  #       # redirect_to manager_dashboard_path
  #     elsif user.default?
  #       # redirect_to user_dashboard_path
  #     end
  #   else
  #     flash[:error] = "Your credentials are bad and you should feel bad"
  #     render :new
  #   end
  # end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
