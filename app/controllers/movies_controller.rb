class MoviesController < ApplicationController
  def index
    @user = User.find(params[:id])
    @url = "https://api.themoviedb.org"
  end 

  def trending
    @user = User.find(params[:id])
    @url = "https://image.tmdb.org/t/p/w500"
    @movies = MovieFacade.search_trending
    render :index
  end

  def search
    @user = User.find(params[:id])
    @url = "https://image.tmdb.org/t/p/w500"
    @movies = MovieFacade.search_movies(params[:search], params[:page])
    render :index
  end

  def movie_data
    @movie = Movie.new(movie_params)
    render :show
  end

  def show
    @url = "https://image.tmdb.org/t/p/w500"
    @movie1 = movie_poro(movie_params)
  end

  def new
    @user = current_user
    @movie = Movie.new(movie_params)
  end

  def create
    @user = current_user
    @movie = MoviePoros.new(movie_params)
    if @movie.save
      redirect_to user_movies_path(@user)
    else
      render :new
    end
  end

  private
  def movie_params
    params.permit(:id, :title, :release_date, :overview, :image_url, :average_rating, :genre, :runtime)
  end
end