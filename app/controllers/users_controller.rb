class UsersController < ApplicationController
  def new
    User.new
  end

  def create
binding.pry
  end

  private

end