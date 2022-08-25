class ApplicationController < ActionController::Base

  def home
    @users = User.all
  end
end
