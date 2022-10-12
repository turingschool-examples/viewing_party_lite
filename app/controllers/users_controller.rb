class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        
        if @user.save
            redirect_to user_path(@user)
        else
            redirect_to register_path(@user)
            flash[:alert] = "You must fill out all fields to register"
        end
    end

    private

    def user_params
        params.require(:user).permit(:user_name, :email)
    end
end