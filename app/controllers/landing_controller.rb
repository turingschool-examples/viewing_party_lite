class LandingController < ApplicationController

  def dashboard
    @users = User.all
  end
end
