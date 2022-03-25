class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @invitations = @user.invitations
    @host_parties = @user.is_host
    @not_hosted_movies = @user.invitations.map do |party|
      MovieFacade.new.details(party.movie_id) 
    end 
    @hosted_movies = @user.is_host.map do |party|
      MovieFacade.new.details(party.movie_id) 
    end 
  end

  def create
    @user = User.create(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render 'new'
    end
  end

  def discover
    @user = User.find(params[:id])
  end

private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
