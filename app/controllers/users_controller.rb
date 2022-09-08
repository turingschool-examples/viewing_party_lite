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

    def login_user
        if !params[:email].present? || !params[:password].present?
            redirect_to login_path, notice: "Error: please fill in all fields"
        elsif User.exists?(email: params[:email])
            @user = User.find_by(email: params[:email])
            if @user.authenticate(params[:password])
                session[:user_id] = @user.id
                redirect_to "/users/#{@user.id}/discover"
            else
                redirect_to login_path, notice: "Error: login failed"
            end
        else
            redirect_to login_path, notice: "Error: login failed"
        end
    end

    private
    def user_params
        params.permit(:first_name,:last_name,:email, :password, :password_confirmation)
    end

end 