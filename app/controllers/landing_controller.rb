class LandingController < ApplicationController

  def index #index because this is the broad over view page its a home page with access to EVERY user
    @users = User.all#give me every single user, have non in tests yet so this is an empty array but it works
  end
end
