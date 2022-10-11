class WelcomeController < ApplicationController

  def index
    @users = User.all
  end

  def register
  end

end 
