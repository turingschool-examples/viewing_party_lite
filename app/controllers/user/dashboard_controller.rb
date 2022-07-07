class User::DashboardController < ApplicationController
  def index
    binding.pry
    @user = User.find(params[:id])
  end
end