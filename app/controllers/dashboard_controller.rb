class DashboardController < ApplicationController
  
  def index
    @user = User.find(params[:user_id])
    @viewing_parties = @user.viewing_partiesx
  end
end
