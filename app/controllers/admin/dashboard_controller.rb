class Admin::DashboardController < ApplicationController
  before_action :require_admin

  def index
    @users = User.default_users
  end

  private

  def require_admin
    unless current_admin?
      flash[:error] = 'Oops, you are not authorized to access that page!'
      redirect_to '/'
    end
  end
end
