# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def welcome
    @users = User.all
  end
end
