class ViewingPartiesController < ApplicationController
  before_action :find_user

  def new
    @movie = Movie.find(params[:movie_id])
  end

  def create
    @user = User.create(user_params)
    if @user.save
      flash[:success] = 'Account Successfully Created'
      redirect_to "/users/#{@user.id}"
    else
      flash[:error] = 'Invalid Entry'
      render 'new'
    end
  end

end
