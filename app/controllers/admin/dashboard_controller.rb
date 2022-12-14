class Admin::DashboardController < ApplicationController
  before_action :find_admin_user
  
  def index
    @users = User.where(role: 'default')
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def find_admin_user
    @admin_user = User.find(session[:user_id])
  end
end