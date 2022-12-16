class MoviesController < ApplicationController
  before_action :find_user

  def index
    if params[:search].present?
      @movies = MovieFacade.movie_search(params[:search])
    else
      @movies = MovieFacade.top_rated
    end
  end

  def show
    movie_id = params[:id]
    conn = Faraday.new(url: 'https://api.themoviedb.org/3') do |faraday|
      faraday.params['api_key'] = ENV['movie_api_key']
    end

    response = conn.get("movie/#{movie_id}")

    @movie = JSON.parse(response.body, symbolize_names: true)
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end
end
