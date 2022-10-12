class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
    end

    def new

    end

    def create

    end

    private

    def user_params
        params.permit(:user_name, :email, :password_digest)
    end
end