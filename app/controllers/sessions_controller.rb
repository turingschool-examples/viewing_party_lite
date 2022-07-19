class SessionsController < ApplicationController
    def new

    end

    def create
        user = User.find_by(email: params[:email]) 
        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else 
            redirect_to '/login'
            flash[:error] = "Invalid Credentials, try again."
        end
    end
end