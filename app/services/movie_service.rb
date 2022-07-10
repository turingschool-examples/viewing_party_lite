# frozen_string_literal: true

class MovieService
  def self.conn
    Faraday.new(url: 'https://api.themoviedb.org/') do |faraday|
      faraday.params['api_key'] = ENV['movie_api_key']
    end
  end

  def self.top_movies
    response1 = MovieService.conn.get('/3/movie/top_rated')
    response2 = MovieService.conn.get('/3/movie/top_rated?page=2')

    json_hash1 = JSON.parse(response1.body, symbolize_names: true)
    json_hash2 = JSON.parse(response2.body, symbolize_names: true)

    [json_hash1, json_hash2]
  end

  def self.movie_search(keyword)
    response1 = MovieService.conn.get("/3/search/movie?query=#{keyword}")
    response2 = MovieService.conn.get("/3/search/movie?query=#{keyword}&page=2")

    json_hash1 = JSON.parse(response1.body, symbolize_names: true)
    json_hash2 = JSON.parse(response2.body, symbolize_names: true)

    [json_hash1, json_hash2]
  end

  def self.movie_lookup(id)
    response = MovieService.conn.get("/3/movie/#{id}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.cast_lookup(id)
    response = MovieService.conn.get("/3/movie/#{id}/credits")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.review_lookup(id)
    response = MovieService.conn.get("/3/movie/#{id}/reviews")
    JSON.parse(response.body, symbolize_names: true)
  end
end
