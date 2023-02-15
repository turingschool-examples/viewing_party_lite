class MoviesController < ApplicationController
  def index
    if params[:q] == 'top rated'

      @movies = MovieFacade.find_movies("discover/movie?api_key=#{ENV['movie_api_key']}&language=en-US&sort_by=vote_average.desc&include_adult=false&include_video=false&page=1&vote_count.gte=1000")

    elsif params[:commit]

      @movies = MovieFacade.find_movies("search/movie?api_key=#{ENV['movie_api_key']}&language=en-US&query=#{params[:title]}&page=1&include_adult=false")

    end

    if @movies.is_a?(Hash) && (@movies[:success] == false)
      flash[:error] = @movies[:errors]
      redirect_to discover_index_path
    end
  end

  def show
    @movie = MovieFacade.find_movie(params[:id])

    @cast = MovieFacade.find_cast(params[:id])

    @reviews = MovieFacade.find_reviews(params[:id])
  end
end
