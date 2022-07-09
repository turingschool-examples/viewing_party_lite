class ApplicationController < ActionController::Base

  def find_user
    @user  = User.find(params[:id])
  end
end
