class UsersController < ApplicationController
  before_action :get_user, only: [:show]

  def new
    @user = User.new
  end

  def show
  end

  def create
    user = User.new(user_params)
    if params[:name].empty? || params[:email].empty?
      flash[:notice] = 'fields can not be blank'
      render :new
    elsif !user.save
      flash[:notice] = 'email is invalid'
      render :new
    else 
      user.save
      redirect_to "/users/#{user.id}"
    end
  end

  private
    def get_user
      @user = User.find(params[:id])
    end

    def user_params
      params.permit(:name, :email)
    end
end
