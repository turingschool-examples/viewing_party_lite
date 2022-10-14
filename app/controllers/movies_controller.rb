class MoviesController < ApplicationController
  def show
    @movie_details = MovieDetailPresenter.new(params[:id], params[:movie_id])
  end
end
