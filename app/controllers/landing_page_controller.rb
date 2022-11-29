class LandingPageController < ApplicationController
  def index
    @users = User.all
  end

  def show
    redirect_to new_user_path
  end
end
