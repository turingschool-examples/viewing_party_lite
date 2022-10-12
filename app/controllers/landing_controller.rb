class LandingController < ApplicationController
    def index
      @users = User.all
    end
    
    def about
    end
end