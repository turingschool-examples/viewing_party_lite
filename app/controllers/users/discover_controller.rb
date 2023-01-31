class Users::DiscoverController < ApplicationController
  def index
    @users = User.all
  end
end
