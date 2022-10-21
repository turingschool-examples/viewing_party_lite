class HomePageController < ApplicationController

  def index
    @users = User.all
  end

end
