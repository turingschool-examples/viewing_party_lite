
class PagesController < ApplicationController
  before_action :current_user
  # before_action :require_user

  def home
    # require 'pry'; binding.pry
    @user = current_user
    
    @users = User.all
  end

  # private
  # def require_user
  #   render file: "/public/404" unless current_user
  # end
end
