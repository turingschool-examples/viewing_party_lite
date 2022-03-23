class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
  end

  def create
    user = User.create!(name: params[:name], email: params[:email])
    redirect_to "/users/#{user.id}"
  end
end
