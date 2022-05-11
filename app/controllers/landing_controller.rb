class LandingController < ApplicationController
  def index
    @user = User.all
  end
end
