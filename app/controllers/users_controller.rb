class UsersController < ApplicationController
  before_action :set_user, only: %i[update destroy show]
  def index; end

  def new; end

  def discover; end

  def show; end

  def update; end

  def destroy; end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
