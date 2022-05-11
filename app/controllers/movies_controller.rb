class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])

  end
end


# <a href="/users/:id/movies/#{@movie.id}"> @movie.name </a>
