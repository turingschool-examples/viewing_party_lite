class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])

    @parties_hosting = @user.parties_hosting
    @hosting_movies = @user.hosting_movies
    @hosting_party_invitees = @parties_hosting.map { |party| party.users }

    @parties_invited_to = @user.parties_invited_to
    @invited_to_movies = @user.invited_to_movies
    @invited_to_invitees = @parties_invited_to.map { |party| party.users }
  end

  def create
    @user = User.new(user_params)

    if @user.save && user_params[:password] == user_params[:password_confirmation]
      redirect_to "/users/#{@user.id}"
    else
      redirect_to "/register"
      flash[:error] = @user.errors.full_messages
    end
  end

  def login_form
  end

  def login
    user = User.find_by(email: params[:email])
    
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.username}!"
      redirect_to root_path
    else
      flash[:error] = "Sorry, your credentials are bad."
      render :login_form
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
