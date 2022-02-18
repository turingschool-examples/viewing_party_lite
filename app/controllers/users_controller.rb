class UsersController < ApplicationController
  before_action :require_user, :except => :new
  def new
  end

  def show
    @user = current_user
    @facade = MovieFacade.new
    @invited_parties = @user.viewing_parties
    @hosted_parties = ViewingParty.where(user_id: @user.id)
  end

  def create
    if params[:user][:password] == params[:user][:password_confirmation]
      user = User.new(user_params)
      if user.save
        session[:user_id] = user.id
        redirect_to "/dashboard"
      else
        user.errors.messages.each do |field, error|
          flash[field] = "#{field} #{error.first}"
        end
        redirect_to "/register"
      end
    else
      redirect_to "/register", notice: "Passwords do not match"
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
