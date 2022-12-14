class DashboardController < ApplicationController
  before_action :require_user

  def show
    @user = current_user

  end

  private
    def require_user
      redirect_to '/' unless current_user
    end
end
