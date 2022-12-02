# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    @users = User.all
  end
end
