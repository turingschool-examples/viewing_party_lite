class UsersController < ApplicationController

  def new
  end

  def create
    user = User.create(user_params)

    if user.save
      session[:user_id] = user.id
      redirect_to "/users/#{user.id}"
    else
      redirect_to "/register"
      flash[:alert] = "Error: #{error_message(user.errors)}"
      #flash[:alert] = "Error: #{user.errors.full_messages.to_sentence}"
    end
  end

  def show
    if params.include?("party_id")
     @user = User.find(params[:id])
     change_status(params[:party_id])
    else
      @user = User.find(params[:id])
    end
  end

  def login_form
  end

  def login_user
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      #binding.pry
      redirect_to "/users/#{user.id}"
      #binding.pry
    else
      flash[:error]= "You ain't nobody"
      render :login_form
    end
  end

  private
    def user_params
      params.permit(:name, :email, :password, :password_confirmation)
    end

    def change_status(party_id)
     view_party = UserParty.find_by(user_id: @user.id, party_id: params[:party_id])
     view_party.status = "1"
     view_party.save
    end
end
