class DiscoverController < ApplicationController
  before_action :find_user, only: [:index]

  def index; end

  private

  def find_user
    @user = User.find(params[:user_id])
  end
end
