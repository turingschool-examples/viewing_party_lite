class UsersController < ApplicationController 
    def show 
        @user = User.find(params[:id])
        @hosts_parties = @user.hosting
    end 
end 