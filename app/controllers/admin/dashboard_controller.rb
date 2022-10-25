class Admin::DashboardController < ApplicationController
  def index
    @users = User.where(admin: :false)
  end
end
