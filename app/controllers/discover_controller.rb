class DiscoverController < ApplicationController
  def index
    # binding.pry
    @user = User.find(params[:user_id])
  end
end
