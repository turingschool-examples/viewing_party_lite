class WelcomeController < ApplicationController
  before_action :set_users, only: [:index]

  def index;end

  private

  def set_users
    @users = User.all
  end
end
