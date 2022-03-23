class ApplicationController < ActionController::Base

  def landing
    @users = User.all 
  end
end
