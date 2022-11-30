class MoviesController < ApplicationController
  def index
    conn = Faraday.new(
      url: "https://api.themoviedb.org",
      params: {api_key: Figaro.env.tmdb_api_key}
    )

    response = conn.get("/3/movie/top_rated")
    json_body = response.body
    parsed_response = JSON.parse(json_body, symbolize_names: true)
    require "pry"; binding.pry

  end

end
