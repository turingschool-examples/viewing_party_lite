class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    if Current.user
      @viewing_parties = Current.user.party_users.map do |party|
        { movie: MovieFacade.create_movie_details(party.viewing_party.movie_id), party: party.viewing_party,
          host: party.host }
      end
    else
      redirect_to root_path
      flash[:alert] = 'You must be logged in or registered to access your dashboard'
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      flash[:alert] = 'User Created'
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      flash[:alert] = user.errors.full_messages.join(',')
      redirect_to register_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
