class Admin::UsersController < ApplicationController
  before_action :require_admin

  def show
    @user = User.find(params[:id])
  end

  private

  def require_admin
    unless current_admin?
      flash[:error] = 'Oops, you are not authorized to access that page!'
      redirect_to '/'
    end
  end
end
