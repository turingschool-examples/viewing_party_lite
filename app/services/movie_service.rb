# frozen_string_literal: true

class MovieService
  def self.conn
    Faraday.new('https://api.themoviedb.org')
  end

  def self.get_top_rated
    response ||= conn.get("/3/movie/top_rated?api_key=#{ENV['movie_api_key']}&page=1") # gets top 20 movies
    parsed_json = JSON.parse(response.body, symbolize_names: true)
    parsed_json[:results]
  end

  def self.get_movie_search(search_param)
    response = conn.get("/3/search/movie?&api_key=#{ENV['movie_api_key']}&language=en-US&page=1&query=#{search_param}")
    parsed_json = JSON.parse(response.body, symbolize_names: true)
    parsed_json[:results]
  end
end
