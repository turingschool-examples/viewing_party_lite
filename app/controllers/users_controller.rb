class UsersController < ApplicationController 
  def new   
  end

  def show #user Dashboard
 
    @user = User.find(params[:id])
    # @user_party = UserParties.find(params[:user_id])
  end
end