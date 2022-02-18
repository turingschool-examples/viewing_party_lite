class ApplicationController < ActionController::Base

  helper_method :current_user

  def current_user
   User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
    if !current_user
      redirect_to "/", notice: 'You must be logged in'
    end
  end
end
