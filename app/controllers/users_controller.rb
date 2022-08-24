class UsersController < ApplicationController
    def new 

    end

    def show 
        @user = User.find(params[:id])
    end

    def create 
        user = User.create!(user_params)
        if user.save
            redirect_to "/users/#{user.id}"
            flash[:alert] = 'user successfully created'
        else
            redirect_to "/register"
            flash[:error] = 'unable to create user'
        end
    end

    private 

    def user_params 
        params.permit(:name, :email)
    end
end