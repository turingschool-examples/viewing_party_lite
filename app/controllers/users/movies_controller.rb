class Users::MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @top_rated_movies = parse(top_rated_movies)
  end

  def api_call
    binding.pry
    Faraday.new(url: "https://api.themoviedb.org/?api_key=#{ENV['movie_api_key']}")
  end

  def top_rated_movies
    api_call.get("3/movie/top_rated?language=en-US&limit=20")
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end