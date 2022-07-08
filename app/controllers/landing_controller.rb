# frozen_string_literal: true

class LandingController < ApplicationController
  def home
    @users = User.all
  end
end
