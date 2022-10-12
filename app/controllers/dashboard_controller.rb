class DashboardController < ApplicationController
  before_action :require_user, only: [:index]

  def index
  end

  # private
  # def user_params
  #   params.require(:user).permit(:name, :email, :password, :password_confirmation)
  # end
end
