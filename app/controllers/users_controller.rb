class UsersController < ApplicationController
  def new; end

  def create
    user = User.create(app_params)
    if user.valid?
      flash[:success] = "Welcome, #{user.name}"
      redirect_to user_path(user)
    else
      flash[:alert] = "Error: #{error_message(user.errors)}"
      redirect_to register_path
    end
  end

  def show
   if session[:user_id]
      @user = User.find(session[:user_id])
      @viewing_parties = @user.users_parties
    else
      flash[:alert] = "Error You must be logged in or registered to access my dashboard"
      redirect_to "/"
    end
  end

  def login_form; end

  def login_user
    user = User.find_by(email: params[:email])
    if user &&
       if user.authenticate(params[:password])
         session[:user_id] = user.id
         redirect_to '/dashboard'

       else
         redirect_to '/login'
         (flash[:alert] = 'Incorrect Password')
       end
    else
      redirect_to '/login'
      flash[:alert] = 'Incorrect Email entered'
    end
  end

  def logout_user
    reset_session
    redirect_to '/'
  end

  private

  def app_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
