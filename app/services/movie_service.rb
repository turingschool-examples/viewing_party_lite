# frozen_string_literal: true

class MovieService
  def self.conn
    Faraday.new(url: "https://api.themoviedb.org/3?api_key=#{ENV['movie_api_key']}")
  end

  def self.movie(movie_id)
    response = conn.get("movie/#{movie_id}")
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.reviews(movie_id)
    response = conn.get("movie/#{movie_id}/reviews")

    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.credits(movie_id)
    response = conn.get("movie/#{movie_id}/credits")
    json = JSON.parse(response.body, symbolize_names: true)[:cast]
  end

  def self.top_rated
    response = conn.get("movie/top_rated")
    json = JSON.parse(response.body, symbolize_names: true)
    #
  end
end
