class PartiesController < ApplicationController
  def new
    # require 'pry'; binding.pry
    # @user = User.find(params[:user_id])
    @users = User.all
    movie_data = MoviesService.new.search(params[:id])
    @title = movie_data[:original_title]
    @runtime = movie_data[:runtime]
  end

  def create

  end


end