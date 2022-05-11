class UsersController < ApplicationController
  def dashboard
  end

  def create
    new_user = User.new(user_params)
    if new_user[:name] == nil || new_user[:email] == nil
      flash[:notice] = "Please fill in all fields."
      render '/register'
    elsif User.email_list.include?(new_user[:email])
      flash[:notice] = "Sorry. That email address is not available."
      render '/register'
    else
      new_user.save
      redirect_to "/users/#{new_user.id}"
    end
  end

  private
  def user_params
    params.permit(:name, :email)
  end
end
