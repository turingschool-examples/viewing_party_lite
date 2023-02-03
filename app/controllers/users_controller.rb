class UsersController < ApplicationController 
  def show 
    @user = User.find(params[:id])
    
    @viewing_party_details = @user.viewing_parties.map do |party|
      movie = MoviesFacade.movie_details(party.movie_id)
    end
  end

  def discover
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    if user.save
      redirect_to user_path(user)
    else
      flash[:notice] = user.errors.full_messages.to_sentence
      redirect_to register_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
