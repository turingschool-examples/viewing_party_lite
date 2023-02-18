class ApplicationController < ActionController::Base
  helper_method :current_user, :current_admin?

  def current_user
    current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def require_user
    if !current_user
      redirect_to root_path
      flash[:alert] = 'You must be logged in'
    end
  end

  def current_admin?
    current_user && current_user.admin?
  end

  def require_admin
    if !current_admin?
      redirect_to root_path
      flash[:alert] = 'Not authorized'
    end
  end
end
