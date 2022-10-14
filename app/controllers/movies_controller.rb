class MoviesController < ApplicationController

  def index #Stephen edit
    @user = User.find(params[:user_id])
    if params[:q].present?
      @movies_array = MovieFacade.top_rated_poro
    elsif params[:search_movies].present?
      @movies_array = MovieFacade.search_poro(params[:search_movies])
    else
      redirect_to user_discover_path(@user)
    end
  end
  #   params[:q] # value of 'q' is used to filter API search
  #   # @movies = @filter_search_results(params[:q]) <-- value of 'q' passed as variable
  # end

  def search
    @user = User.find(params[:user_id])
    # conn = Faraday.new(
    #   url: 'https://api.themoviedb.org/3/movie/',
    #   params: {api_key: ENV['moviebd_api_key']}
    #   )

    # top_rated = conn.get('/top_rated')
  end

  def show #Stephen edit
    @user = User.find(params[:user_id])
    @movie = MovieFacade.details_poro(params[:id])
    @movie_cast = MovieFacade.credits_poro(params[:id])
    @movie_reviews = MovieFacade.reviews_poro(params[:id])
  end
end
