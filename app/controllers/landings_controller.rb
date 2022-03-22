class LandingsController < ApplicationController

  def index
    @users = User.all
  end

end
