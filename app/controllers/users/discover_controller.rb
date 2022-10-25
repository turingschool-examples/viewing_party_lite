# frozen_string_literal: true

module Users
  class DiscoverController < ApplicationController
    def index
      @user = User.find(session[:user_id]) if session[:user_id]
    end
  end
end
