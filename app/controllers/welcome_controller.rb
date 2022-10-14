# frozen_string_literal: true

class WelcomeController < ApplicationController
  def landing
    @users = User.all
  end
end
