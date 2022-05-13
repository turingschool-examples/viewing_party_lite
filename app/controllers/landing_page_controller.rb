class LandingPageController < ApplicationController
  def main
    @users = User.all
  end
end
