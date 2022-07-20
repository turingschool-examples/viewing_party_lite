class DashboardController < ApplicationController
  before_action :require_user
  def index
    @user = User.find(session[:user_id])
  end

  private
  def require_user
    if !current_user
      redirect_to root_path
      flash[:error] = "You must sign in or create an account."
    end
  end
end