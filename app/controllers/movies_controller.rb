class MoviesController < ApplicationController
  def search
    conn = Faraday.new(url: "https://api.themoviedb.org") do |f|
      f.params["api_key"] = ENV['api_key']
    end
    query = params[:search]
    response = conn.get("/3/search/movie?query={#{query}}")

    data = JSON.parse(response.body, symbolize_names: true)

    movies = data[:results]
  end
end