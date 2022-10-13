class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # @users = User.all
    @movies = @user.parties.map do |party|
      MovieFacade.movie_details(party.movie_id)
    end

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      flash[:alert] = "Did NOT save" #flash.alert too
      redirect_to "/register/new"
    end
  end


  private
  def user_params
    params.require(:user).permit(:name, :email)
  end

end
