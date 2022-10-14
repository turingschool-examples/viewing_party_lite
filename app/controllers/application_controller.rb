class ApplicationController < ActionController::Base
  before_action :set_user, except: [:home]

  private
  def error_message(errors)
    errors.full_messages.join(', ')
  end

  def set_user
    if params[:user_id].present?
      @user = User.find(params[:user_id]) 
    elsif params[:id].present?
      @user = User.find(params[:id])
    end 
  end
end
