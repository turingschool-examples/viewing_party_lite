class Users::MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @movies = parse(display_results)
  end

  private
  def api_call
    Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params["api_key"] = ENV["movie_api_key"]
    end
  end

  def display_results
    if params[:query]
      search_results(params[:query])
    else
      top_rated_movies
    end
  end

  def search_results(search_params)
    api_call.get("/3/search/movie?query=#{search_params}")
  end

  def top_rated_movies
    api_call.get("3/movie/top_rated?language=en-US&limit=20")
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end