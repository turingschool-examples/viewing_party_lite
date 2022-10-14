# frozen_string_literal: true

class MovieService
  def self.get_top_rated
    response ||= conn.get("/3/movie/top_rated?api_key=#{ENV['movie_api_key']}&page=1") # gets top 20 movies
    MovieService.parse(response)[:results]
  end

  def self.get_movie_search(search_params)
    response = conn.get("/3/search/movie?&api_key=#{ENV['movie_api_key']}&language=en-US&page=1&query=#{search_params}")
    MovieService.parse(response)[:results]
  end

  def self.get_individual_movie(movie_id)
    response = conn.get("/3/movie/#{movie_id}?api_key=#{ENV['movie_api_key']}&language=en-US")
    MovieService.parse(response)
  end

  def self.get_cast(movie_id)
    response = conn.get("/3/movie/#{movie_id}/credits?api_key=#{ENV['movie_api_key']}&language=en-US&cast=1")
    MovieService.parse(response)
  end

  def self.get_reviews(movie_id)
    response = conn.get("/3/movie/#{movie_id}/reviews?api_key=#{ENV['movie_api_key']}")
    MovieService.parse(response)
  end

  def self.conn
    Faraday.new('https://api.themoviedb.org')
  end
  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
