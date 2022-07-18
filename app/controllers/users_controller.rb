class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @movies = @user.parties.map { |party| MoviesFacade.get_poster(party.movie_id) }
  end

  def new

  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to user_path(user.id)
      flash[:success] = "Welcome, #{user.name}"
    else
      redirect_to "/register"
      
      
      # user.errors.full_messages for flash message sad path
      flash[:error] = "User not created: Please fill out credentials fully and correctly"
    end
  end

  def login_form
    
  end

  def login_user
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      redirect_to user_path(user.id)
      flash[:success] = "Welcome, #{user.email}!"
    else
      redirect_to '/login'
      # try to use user.errors.full_messages
      flash[:error] = "Invalid Credentials. Please try again."
    end
  end
  
  

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
  
  
end
