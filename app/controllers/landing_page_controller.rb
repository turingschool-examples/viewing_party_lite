class LandingPageController < ApplicationController
  def index
    @users = User.all
    # require 'pry'; binding.pry
  end
end