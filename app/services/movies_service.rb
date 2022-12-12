
require 'pry'
require 'faraday'

class MoviesService
  def search(input)
    conn = Faraday.new(url: 'https://api.themoviedb.org', params: { api_key: ENV['movie_api_key'] })

    response = conn.get("/3/movie/#{input}")

    JSON.parse(response.body, symbolize_names: true)
  end

  def keyword_search(input)
    conn = Faraday.new(url: 'https://api.themoviedb.org', params: { api_key: ENV['movie_api_key'] })
require 'pry'; binding.pry
    response = conn.get('/3/search/movie', { query: input })

    JSON.parse(response.body, symbolize_names: true)
  end

  def cast_list(input)
    conn = Faraday.new(url: 'https://api.themoviedb.org', params: { api_key: ENV['movie_api_key'] })

    response = conn.get("/3/movie/#{input}/credits")

    JSON.parse(response.body, symbolize_names: true)
  end

  def reviews(input)
    conn = Faraday.new(url: 'https://api.themoviedb.org', params: { api_key: ENV['movie_api_key'] })

    response = conn.get("/3/movie/#{input}/reviews")

    JSON.parse(response.body, symbolize_names: true)
  end
end
