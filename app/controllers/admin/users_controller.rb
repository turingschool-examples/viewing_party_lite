class Admin::UsersController < ApplicationController
  before_action :require_admin

  def show
    @user = User.find(params[:id])
    @viewing_parties = @user.party_users.map do |party|
      { movie: MovieFacade.create_movie_details(party.viewing_party.movie_id), party: party.viewing_party,
        host: party.host }
    end
  end

  private

  def require_admin
    unless Current.user && Current.user.admin?
      redirect_to root_path
      flash[:error] = 'You are not authorized to access those pages'
    end
  end
end
