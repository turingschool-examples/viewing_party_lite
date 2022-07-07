class MoviesController < ApplicationController
  def top_rated
    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params: {params: '1)'}
    end

    response = conn.get("/3/movie/top_rated") do |req|
      req.params['limit'] = 40
      req.body = {query: "api_key=#{ENV['movie_api_key']}"}.to_json
    end

    data = JSON.parse(response.body, symbolize_names: true)

    top_movies = data[:results].first(40)

    render user_movies_discover_path
  end
end