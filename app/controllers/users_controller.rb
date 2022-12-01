require_relative '../facades/movie_facade'

class UsersController < ApplicationController
  def new
    # @user = User.new
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
    @user.parties.each do |party|
      @movie_title = MovieFacade.movie_title(party.movie_id)
      @movie_image = MovieFacade.movie_image(party.movie_id)
    end
  end
  
  def discover
    
  end

  private

  def user_params
    params.permit(:name, :email)
  end

end