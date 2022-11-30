# frozen_string_literal: true

class MovieService
  def self.conn
    Faraday.new(url: 'https://api.themoviedb.org/3/')
  end

  def self.movie_by_id(id)
    response = conn.get("movie/#{id}?api_key=#{ENV['movie_api_key']}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.movies_by_keyword(keyword)
    response = conn.get("search/movie?api_key=#{ENV['movie_api_key']}&query=#{keyword}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.find_top_rated_movies
    response = conn.get("movie/top_rated?api_key=#{ENV['movie_api_key']}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
