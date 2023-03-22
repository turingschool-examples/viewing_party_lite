class UsersController < ApplicationController

  def show
    # binding.pry
    @user = User.find(params[:id])
    @viewing_parties = @user.viewing_parties
  end

  def new
    
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to "/users/#{user.id}"
    end
  end

  private
    def user_params
      params.permit(:name, :email )
    end
end