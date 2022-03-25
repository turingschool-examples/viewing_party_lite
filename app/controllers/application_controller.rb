# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def landing
    @users = User.all
  end
end
