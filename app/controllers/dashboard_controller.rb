class DashboardController < ApplicationController 
  def index 
    if !current_user
      flash[:alert] = "You must be logged in to view the dashboard"
      redirect_to "/"
    end
  end
end