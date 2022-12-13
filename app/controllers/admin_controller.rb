class AdminController < ApplicationController
  before_action :require_admin
  
  def show
    @user = current_user
  end

  private

  def require_admin
    unless current_admin?
      flash[:alert] = 'Error: You are not authorized to view admin pages'
      return redirect_to '/' 
    end
  end
end