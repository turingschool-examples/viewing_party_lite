class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # @hosted_parties = @user.hosted_parties
    # @invited_parties = @user.invited_parties
    @image_url_hash = MoviesFacade.images(@user.movie_ids)
  end

  def new
    @user = User.new
  end

  def login_form
  end

  def create
    user = user_params
    user[:email] = user[:email].downcase
    new_user = User.new(user_params)
    if new_user.save
      session[:user_id] = new_user.id
      redirect_to user_path(new_user.id)
    else
      redirect_to register_path
      flash[:alert] = "Error: #{error_message(new_user.errors)}"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
