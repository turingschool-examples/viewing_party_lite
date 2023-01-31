class WelcomeController < ApplicationController
  def index 
    # require 'pry'; binding.pry
    @users = User.all
  end
end
