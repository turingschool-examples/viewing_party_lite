class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
    end

    private

    def user_params
        params.require(:user).permit(:user_name, :email)
    end
end