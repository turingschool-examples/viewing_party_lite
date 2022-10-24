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

  def login_user
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      flash[:alert] = "Error: #{error_message(user.errors)}"
      render :login_form
    end
  end

  def create
    user = user_params
    user[:email] = user[:email].downcase
    new_user = User.new(user_params)
    if user.save
      redirect_to user_path(user.id)
    else
      redirect_to register_path
      flash[:alert] = "Error: #{error_message(user.errors)}"
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
