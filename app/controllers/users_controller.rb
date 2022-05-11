class UsersController < ApplicationController
  before_action :get_user, only: [:show]

  def new
  end

  def show
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to "/users/#{user.id}"
    else
      user.errors.full_messages.each do |message|
        flash[:notice] = message
        render :new
      end
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
