class MoviesController < ApplicationController
before_action :set_user
  def index
  	if params[:q] == 'top rated'
  		@movies = facade.top20
  		@something = 'something'
  		# require 'pry'; binding.pry
  		# redirect_to user_movies_path(@user.id)
  	end
  end


  def facade
  	@_facade ||= MovieFacade.new
  end

  private
  def set_user
  	@user = User.find(params[:user_id])
  end
end