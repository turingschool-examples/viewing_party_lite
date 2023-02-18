class Admin::DashboardController < ApplicationController
  before_action :require_admin

  def index
    @users = User.where(role: 0)
  end

  def show
    @user = User.find_by_id(params[:id])
  end
end
