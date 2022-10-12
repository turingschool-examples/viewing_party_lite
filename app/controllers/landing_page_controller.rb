# frozen_string_literal: true

class LandingPageController < ApplicationController
  def index
    @users = User.all
  end
end
