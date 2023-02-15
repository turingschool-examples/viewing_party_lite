class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def validate_user
    unless current_user
      flash[:error] = ['User must be logged in']
      redirect_to root_path
    end
  end
end
