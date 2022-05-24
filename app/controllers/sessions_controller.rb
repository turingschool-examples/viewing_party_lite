class SessionsController < ApplicationController

  def new; end

  def create
    user = User.find_by(email: params[:email])
    if user.nil? || !user.authenticate(params[:password])
      flash[:notice] = "Email or password are incorrect"
      render :new
    else
      flash[:success] = "Welcome #{user.name}!"
      redirect_to "/users/#{user.id}"
    end
  end
end
