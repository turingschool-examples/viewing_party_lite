class ApplicationController < ActionController::Base

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
    if !current_user
      flash[:error] = "Please log in to access the requested page"
      redirect_to root_path
    end
  end

  def require_user_party
    if !current_user
      flash[:error] = "Please log in to to create a movie party"
      redirect_back fallback_location: movie_path(params[:movie_id])
    end
  end
end
