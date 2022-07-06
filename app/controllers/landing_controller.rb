class LandingController < ApplicationController

  def home
    @users = User.all
  end
end
