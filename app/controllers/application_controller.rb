class ApplicationController < ActionController::Base

  def error_message(error)
      error.full_messages.join(', ')
  end

  def find_user
    @user = User.find(params[:id])
  end
end
