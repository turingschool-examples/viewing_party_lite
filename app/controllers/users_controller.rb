require_relative '../facades/movie_facade'

class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to "/users/#{user.id}"
    else
      redirect_to '/register'
      flash[:alert] = "Error: #{error_message(user.errors)}"
    end
  end

  def show
    @user = User.find(params[:id])
    @parties_info = @user.movie_cards_info
  end

  def discover
  end

  private

  def user_params
    params.permit(:name, :email)
  end

end