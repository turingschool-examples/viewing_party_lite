class ApplicationController < ActionController::Base

  private

    def error_message(errors)
      errors.full_messages.join(", ")
    end

    def get_user
      @user = User.find(session[:user_id])
    end
end
