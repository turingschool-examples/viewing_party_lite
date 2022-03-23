class UsersController < ApplicationController

  def new

  end

  def show
    @user = User.find(params[:id])
  end

  def create
    user = User.new(name: params[:name], email: params[:email])

    if user.save
      redirect_to user_path(user.id)
    else
      redirect_to "/register"
    end
  end

  private
   def user_params
     params.require(:email, :name)
   end
end
