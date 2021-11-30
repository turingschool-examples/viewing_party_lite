class MoviesController < ApplicationController
  def search
    conn = Faraday.new(url: "https://www.themoviedb.org/movie") do |faraday|
      faraday.headers["X-API-KEY"] = ENV['movie_api_key']
    end
    response = conn.get("")



  end
end
