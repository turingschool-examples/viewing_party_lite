# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    @current ||= User.find(session[:user_id]) if session[:user_id]
  end
end
