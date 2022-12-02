class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    if params[:top_rated].present?
      @top_rated_movies = MovieFacade.top_rated
    else
      params[:keyword]
      @keyword = params[:keyword]
      @results = MovieFacade.search_movies(@keyword)
    end
  end

  def show
    @user = User.find(params[:user_id])
    id = params[:id]
    @movie = MovieFacade.movie_id(id)
    @cast = MovieFacade.movie_cast(id)
  end

  # def search
  #   conn = Faraday.new(url: 'https://api.themoviedb.org/3') do |faraday|
  #     faraday.headers['api_key'] = ENV['movies_api_key']
  #   end
  # end

  # def top_rated
  #   @user = User.find[:id]
  #   conn = Faraday.new(url: 'https://api.themoviedb.org/3') do |faraday|
  #     faraday.headers['api_key'] = ENV['movies_api_key']
  #   end
  #   response = conn.get('/movie/top_rated')

  #   data = JSON.parse(response.body, symbolize_names: true)

  #   top_rated_movies = data[:results]

  #   render user_movie_path(@user.id)
  # end
end
