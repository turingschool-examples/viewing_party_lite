class PartiesController < ApplicationController
  def new
    binding.pry
    @users = User.all
    @user = User.find(params[:user_id])
    @movie = MovieFacade.**the movie details method**(params[:movie_id])
  end

  def create
    @movie = MovieFacade.**the movie details method**(params[:movie_id])

  end

private

  def party_params
    params.permit(:id, :duration, :date, :time, :host, :movie_id)
    end
end
