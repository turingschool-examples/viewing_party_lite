class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
      if user&.authenticate(params[:password])
        session[:user_id] = user.id
        flash[:success] = "🍿 Welcome #{user.name}! 🍿"
        redirect_to dashboard_path
      else
        redirect_to root_path
        flash[:error] = 'Invalid credentials! 🙈'
      end
  end

  def destroy
    session.destroy
    redirect_to root_path
  end
end
