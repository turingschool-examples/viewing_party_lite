class RegisterController < ApplicationController

  def new

  end

  def create
    if User.create!(name: params[:name],
                     email: params[:email])
                     flash.notice = 'User Has Been Created!'
                     redirect_to "/register"
    else
      flash.notice = 'User Has Not Been Created!'
      redirect_to "/register"
    end

  end

end
