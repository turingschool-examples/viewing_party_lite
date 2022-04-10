class ApplicationController < ActionController::Base
  helper_method :user_logged_in

  def user_logged_in
    #binding.pry
    User.find(session[:user_id]) if session[:user_id]
  end

  private

  def error_message(errors)
    errors.full_messages.join(', ')
  end
end
