class Admin::DashboardController < ApplicationController
  before_action :require_admin

  def index
    @users = User.where(role: 0)
  end

  def show
    @user = User.find(params[:id])
  end

  private
  
  def require_admin
    if !current_admin?
      flash[:alert] = "You are not authorized to view this page"
      redirect_to '/'
    end
  end
end