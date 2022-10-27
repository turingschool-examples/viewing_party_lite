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
    render file: "/public/404" unless current_admin?
  end
end