class ApplicationController < ActionController::Base
  helper_method :current_user 
  helper_method :movie_poro

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def movie_poro(movie)
    MoviePoros.new(movie)
  end
end
