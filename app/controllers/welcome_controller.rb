class WelcomeController < ApplicationController
  def index
    cookies.encrypted[:user_name] = "chin bin"
    @users = User.all
  end
end
