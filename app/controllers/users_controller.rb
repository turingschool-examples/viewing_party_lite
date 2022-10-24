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
    user = User.find_by(email: params[:email]) if User.exists?(email: params[:email]) 
    if !User.exists?(email: params[:email])
      flash[:alert] = "Error: Invalid email address"
      render :login_form
    elsif !user.authenticate(params[:password])
      flash[:alert] = "Error: Invalid password"
      render :login_form
    else
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    end
  end

  def create
    user = user_params
    user[:email] = user[:email].downcase
    new_user = User.new(user_params)
    if new_user.save
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
