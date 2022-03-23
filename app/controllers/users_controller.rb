class UsersController < ApplicationController

  def new

  end

  def show
    @user = User.find(params[:id])
  end

  def create
    user = user_params
    user[:email] = user[:email].downcase
    new_user = User.new(user)
    if new_user.save
      flash[:success] = 'Account Successfully Created!'
      session[:user_id] = new_user.id
      redirect_to user_path(new_user.id)
    else
      flash[:error] = 'Email address is blank/already in use.'
      redirect_to new_user_path
    end
  end

  private
   def user_params
     params.permit(:email, :name)
   end
end
