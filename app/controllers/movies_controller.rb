class MoviesController < ApplicationController
  def show
    if session[:user_id]
      @movie_details = MovieDetailPresenter.new(params[:id], params[:movie_id])
    end
  end
end
