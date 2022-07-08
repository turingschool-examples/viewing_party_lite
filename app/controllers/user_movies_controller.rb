class UserMoviesController < ApplicationController

  def show
    @user = User.find(params[:user_id])
    @movie = MovieFacade.movie_details(params[:movie_id])
    if @movie.cast.length > 10
      @cast = @movie.cast[0..9]
    else
      @cast = @movie.cast
    end
  end

end