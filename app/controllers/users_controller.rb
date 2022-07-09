class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @movies = @user.parties.map { |party| MovieFacade.create_single_movie(party.movie_id) }
    @images = @user.parties.map { |party| MovieFacade.create_single_movie_images(party.movie_id) }
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      flash[:success] = 'Account Successfully Created'
      redirect_to "/users/#{@user.id}"
    else
      flash[:error] = 'Invalid Entry'
      render 'new'
    end
  end

  def search

  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
