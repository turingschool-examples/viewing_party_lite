class LandingController < ApplicationController
  def index
    @disable_nav = true
    @users = User.all
  end
end
