class LandingPageController < ApplicationController
  def index
    @users = User.all
  end
end