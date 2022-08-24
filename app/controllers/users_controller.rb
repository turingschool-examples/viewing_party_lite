class UsersController < ApplicationController

    def index 
        @users = User.all
    end 

    def show 
        @user = User.find(params[:id])
    end 

    def new
    end

    def create
        user = User.new(user_params)

        if user.save
            redirect_to "/users/#{user.id}"
        else
            redirect_to "/users/new"
            flash[:alert] = "Error: Please fill in all fields.  Email must be unique."
        end
    end

    private

    def user_params
        params.permit(:name, :email)
    end
end