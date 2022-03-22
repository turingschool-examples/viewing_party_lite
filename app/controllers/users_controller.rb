class UsersController < ActionController::Base
  def new
    @user = User.new
    # user = User.find(params[:id])
  end
end
