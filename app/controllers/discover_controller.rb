# frozen_string_literal: true

# app/controllers/discover_controller.rb
class DiscoverController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end
end