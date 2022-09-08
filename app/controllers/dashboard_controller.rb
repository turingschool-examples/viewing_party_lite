class DashboardController < ApplicationController
  before_action :require_user, only: [:index]

  def index
  end

  private

  def require_user
    if !current_user
      redirect_to root_path
      flash[:alert] = 'You must be logged in'
    end
  end
end
