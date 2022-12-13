# frozen_string_literal: true

class MoviesService
  def self.top_rated_movies
    response = conn.get('/3/movie/top_rated')
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.search(query)
    response = conn.get("/3/search/movie?query=#{query}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.credits(movie_id)
    response = conn.get("/3/movie/#{movie_id}/credits")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.details(movie_id)
    response = conn.get("/3/movie/#{movie_id}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.headers['Authorization'] = "Bearer #{ENV['movies_api_key']}"
    end
  end

  def self.reviews(movie_id)
    response = conn.get("/3/movie/#{movie_id}/reviews")
    JSON.parse(response.body, symbolize_names: true)
  end
end
