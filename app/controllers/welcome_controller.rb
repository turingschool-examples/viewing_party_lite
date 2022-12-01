class WelcomeController < ApplicationController
  def landing
    @users = User.all
  end
end