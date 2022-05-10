class UsersController < ApplicationController
	before_action :set_user, only: [:discover, :update, :destroy, :show]
  def index; end

  def new; end

  def discover; end
  
  def show; end
  private
  def set_user
  	@user = User.find(params[:id])
  end
end
