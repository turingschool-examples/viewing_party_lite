class RegisterController < ApplicationController

  def new

  end

  def create
    # binding.pry
    user = User.new(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if user.save
      flash.notice = 'User Has Been Created!'
      redirect_to user_path(User.last.id)
    else
      flash.notice = user.errors.full_messages
      redirect_to "/register"
    end

  end

end
