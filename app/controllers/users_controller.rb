class UsersController < ApplicationController
  before_action :get_user, only: [:show]

  def new
    @user = User.new
  end

  def show
  end

  private
    def get_user
      @user = User.find(params[:id])
    end
end
