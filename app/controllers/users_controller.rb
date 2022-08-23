class UsersController < ApplicationController

  def landing
    @users = User.all
  end

  def new

  end

  def register

  end
end
