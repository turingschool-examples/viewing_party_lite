class RegisterController < ApplicationController

  def new

  end

  def create
    User.create!(name: params[:name],
                     email: params[:email])
    flash.notice = 'User Has Been Created!'
    # redirect_to "/register"
  end

end
