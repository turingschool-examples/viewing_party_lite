class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id

      redirect_to dashboard_path if user.default?
      redirect_to admin_dashboard_path if user.admin?

      flash[:alert] = "Welcome, #{user.name}! You are now logged in"
    else
      flash[:alert] = 'Unrecognized email/password combination'
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = 'You have been logged out'
    redirect_to '/'
  end
end