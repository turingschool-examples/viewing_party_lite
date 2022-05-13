class UsersController < ApplicationController
  def new
  end

  def show
    @user = User.find(params[:id])

    @parties_hosting = @user.parties_hosting
    @hosting_movies = @user.hosting_movies

    @parties_invited_to = @user.parties_invited_to
    @invited_to_movies = @user.invited_to_movies
  end

  def create
    user = User.new(user_params)

    if user.save
      redirect_to "/users/#{user.id}"
    else
      redirect_to "/register"
      flash[:alert] = "That email has already been registered. Please enter a new email."
    end
  end

  private

  def user_params
    params.permit(:name, :email)
  end
end
