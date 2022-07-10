class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @movies = @user.parties.map { |party| MoviesFacade.get_poster(party.movie_id) }
  end

  def new

  end

  def create
    user = User.create!(user_params)
    redirect_to user_path(user.id)
  end

  private

  def user_params
    params.permit(:name, :email)
  end
  
  
end
