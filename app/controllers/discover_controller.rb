# frozen_string_literal: true

class DiscoverController < ApplicationController
  def search
    @user = User.find(params[:user_id])
  end
end
