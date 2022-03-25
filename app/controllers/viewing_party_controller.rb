class ViewingPartyController < ApplicationController
  def new
    @users = User.all
    # binding.pry
  end
end
