class UsersController < ApplicationController 

    def show 
        @user = User.find(params[:id])
    end

    def new

    end

    def create
        if !user_params[:password].present? || !user_params[:password_confirmation].present?
            redirect_to "/register", notice: "Error: Please fill in password and password confirmation"
        elsif user_params[:password] != user_params[:password_confirmation]
            redirect_to "/register", notice: "Error: Password and confirmation did not match"
        elsif user_params[:first_name] == "" || user_params[:last_name] == ""
            redirect_to "/register", notice: "Error: Please complete all fields"
        elsif user_params[:email].include?("@") == false
            redirect_to "/register", notice: "Error: Invalid email address"
        elsif User.exists?(email: user_params[:email].downcase)
            redirect_to "/register", notice: "Error: Email address is taken"
        else
            user = User.create(user_params)
            redirect_to "/users/#{user.id}", notice: "User #{user.email} successfully created!"
        end
    end
    
    def movie_show
        @movie = MovieFacade.service(params[:movie_id]) 
        @user = User.find(params[:user_id])
    end

    def login_form
        
    end

    private
    def user_params
        params.permit(:first_name,:last_name,:email, :password, :password_confirmation)
    end

end 