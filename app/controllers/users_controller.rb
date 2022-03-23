class UsersController < ApplicationController

  def new

  end

  def show
    @user = User.find(params[:id])
  end

  def create
    u = user_params
    @user = User.new(u)
    if @user.save
      flash[:notice] = 'Account Successfully Created!'
      redirect_to user_path("#{@user.id}")
    else
      flash[:error] = 'Fields cannot be blank'
      redirect_to new_user_path
    end
  end

  private
   def user_params
     params.permit(:email, :name)
   end
end
