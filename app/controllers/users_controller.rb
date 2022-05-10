class UsersController < ApplicationController
  def create
    @user = User.create!({name: params[:name], email: params[:email]})
    redirect_to "/users/#{@user.id}"
  end

  def new
  end

  def show
  end
end
