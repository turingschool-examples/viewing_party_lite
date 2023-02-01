class DiscoverController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    # require 'pry'; binding.pry
  end
end