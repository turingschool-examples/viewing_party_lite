module Users
  class DiscoverController < ApplicationController
    before_action :require_user
    def index
     @user = User.find(session[:user_id])
    end
  end
end
