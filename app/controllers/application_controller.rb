class ApplicationController < ActionController::Base
  helper_method :current_user

  # def error_message(error)
  #     error.full_messages.join(', ')
  # end

  def find_user
    @user = User.find(params[:id])
  end

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end
end
