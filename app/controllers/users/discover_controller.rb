module Users
  class DiscoverController < ApplicationController
    def index
      set_user
    end

    private

    def set_user
      @user = User.find(params[:user_id])
    end
  end
end