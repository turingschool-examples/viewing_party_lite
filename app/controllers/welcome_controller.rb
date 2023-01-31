class WelcomeController < ApplicationController

  def index
    @users = User.all
  end

  def new

  end

  def create
    
  end
end