class ViewingPartiesController < ApplicationController

  def index
    conn = Faraday.new(url: "https://api.moviedb.org/3”) do |faraday|
      faraday.headers["X-API-KEY"] = ENV['api_key']
    end

    response = conn.get('/movie/top_rated')

    data = JSON.parse(response.body, symbolize_names: true)

  end
end
