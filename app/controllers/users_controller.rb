class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    # How Dani recomended to call the Facade for the movie info
    # @parties = @user.parties
    # @movies = @parties.map {|party| MovieFacade.movie_data(party.movie_id)}
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      flash.alert = @user.errors.full_messages.to_sentence
      redirect_to ('/register')
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
