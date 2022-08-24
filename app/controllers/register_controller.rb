class RegisterController < ApplicationController

  def new

  end

  def create
    # binding.pry
    user = User.new(name: params[:name], email: params[:email])
    if user.save
      flash.notice = 'User Has Been Created!'
      redirect_to user_path(User.last.id)
    else
      flash.notice = 'User Has Not Been Created!'
      redirect_to "/register"
    end

  end

end
