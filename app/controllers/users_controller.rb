class UsersController < ApplicationController

  def welcome
    @users = User.all
  end

  def new
  end
end
