class Admin::DashboardController < ApplicationController
  before_action :require_admin
  
  def index
    @users = User.where(role: 0)
    @admin = current_user
  end

  def show
    render :template => "users/show"
    
    @user = User.where(role: 0)
    @viewing_parties = @user.viewing_parties
    @parties_info = []
    @viewing_parties.each do |party|
      @parties_info << party.collect_display_data
    end
  end

  private

  def require_admin
    render file: "/public/404" unless current_admin?
  end
end