class UsersController < ApplicationController
  def landing
    @users = User.all
  end

  def new
    if User.all_emails.include?(params[:email])
      redirect_to "/register", notice: "This e-mail is already in use. Please use another."
    elsif params[:password] != params[:password_confirm]
      redirect_to "/register", notice: "Your password must match in both password fields."
    else
      new = User.create(name: params[:name], email: params[:email], password_digest: params[:password])
      redirect_to "/users/#{new.id}"
    end
  end

  def register
  end

  def show
    @user = User.find(params[:user_id])
  end

  def discover
    @user = User.find(params[:user_id])
  end
end
