class UsersController < ApplicationController

  def welcome
    @users = User.all
  end
end
