class MoviesController < ApplicationController

  def index
    @user = User.find_by(id: session[:user_id])
    if params.include?("movie")
      movie = params[:movie]
      @movies = MovieFacade.get_list_of_movies(movie)
    else
      @movies = MovieFacade.get_top_20_movies
    end
    #binding.pry
  end

  def show
    if user_logged_in
      @user = User.find_by(id: session[:user_id])
      @movie = MovieFacade.movie_show(params[:id])
      #binding.pry
    else
      redirect_to "/login"
      flash[:alert] = "Error: Log In or register. I need data to sell damnit!"
    end
  end
end
