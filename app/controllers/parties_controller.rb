class PartiesController < ApplicationController
  def new
    @users = User.all
    movie_data = MoviesService.new.search(params[:id])
    @title = movie_data[:original_title]
    @runtime = movie_data[:runtime]
  end

  def create
  end
end