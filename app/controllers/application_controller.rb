class ApplicationController < ActionController::Base
  helper_method :current_user

  def error_message(errors)
      errors.full_messages.join(', ')
  end

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end
end
