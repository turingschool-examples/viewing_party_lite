class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    if params[:search] == ''
      redirect_to user_discover_index_path(@user), notice: 'Search field cannot be blank'
    end
  end
end
