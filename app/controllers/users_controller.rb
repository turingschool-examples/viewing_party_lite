class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @viewing_parties = @user.party_users.map do |party|
      { movie: MovieFacade.create_movie_details(party.viewing_party.movie_id), party: party.viewing_party,
        host: party.host }
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:alert] = 'User Created'
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:alert] = 'Must Include Unique Email'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
