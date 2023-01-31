class UsersController < ApplicationController
  def new
    User.new
  end
end