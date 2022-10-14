# frozen_string_literal: true

class LandingsController < ApplicationController
  def index
    @users = User.all
  end
end
