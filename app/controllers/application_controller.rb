class ApplicationController < ActionController::Base
  def welcome
    @users = User.all
  end
end
