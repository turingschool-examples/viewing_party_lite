class UsersController < ApplicationController

  def new
    
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to "/users/:id"
    end
  end

  private
    def user_params
      params.permit(:name, :email )
    end
end