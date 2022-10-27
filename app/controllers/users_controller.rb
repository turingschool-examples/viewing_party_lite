class UsersController < ApplicationController
  before_action :require_user, only: [:show]
  # before_save :downcase_email
  def show
    @user = User.find(session[:user_id])
    @image_url_hash = MoviesFacade.images(@user.movie_ids)
  end

  def new
    @user = User.new
  end

  def create
    user = user_params
    user[:email] = user[:email].downcase
    new_user = User.new(user_params)
    if new_user.save
      session[:user_id] = new_user.id
      redirect_to dashboard_path
    else
      redirect_to register_path
      flash[:alert] = "Error: #{error_message(new_user.errors)}"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  # def downcase_email
  #   user = user_params
  #   user[:email] = user[:email].downcase
  # end
end
