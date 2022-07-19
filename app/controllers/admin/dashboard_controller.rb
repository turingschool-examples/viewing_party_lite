class Admin::DashboardController < ApplicationController
  before_action :require_admin

  def index
    @users = User.all
  end

  private

  def require_admin
    unless Current.user && Current.user.admin?
      redirect_to root_path
      flash[:error] = 'You are not authorized to access those pages'
    end
  end
end
