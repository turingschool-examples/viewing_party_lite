require 'faraday'
require './app/poros/movie'

class MovieFacade
  def self.search(title)
    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params["api_key"] = 'a9f28a7ce46d86cfac371bf3b2883ad5' #ENV['movie_api_key']
      faraday.params["query"] = title
    end
    response = conn.get("/3/search/movie")

    data = JSON.parse(response.body, symbolize_names: true)
    # require "pry"; binding.pry
    movies = data[:results][0..19]
  end

  def self.top_rated
    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params["api_key"] = 'a9f28a7ce46d86cfac371bf3b2883ad5' #ENV['movie_api_key']
    end
    response = conn.get("/3/movie/top_rated")

    data = JSON.parse(response.body, symbolize_names: true)
    # require "pry"; binding.pry
    movies = data[:results][0..19]
  end

  def self.find_movie(movie_id)
    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params["api_key"] = 'a9f28a7ce46d86cfac371bf3b2883ad5' #ENV['movie_api_key']
    end

    details_response = conn.get("/3/movie/#{movie_id}")
    credits_response = conn.get("/3/movie/#{movie_id}/credits")
    reviews_response = conn.get("/3/movie/#{movie_id}/reviews")

    details_data = JSON.parse(details_response.body, symbolize_names: true)
    credits_data = JSON.parse(credits_response.body, symbolize_names: true)
    reviews_data = JSON.parse(reviews_response.body, symbolize_names: true)

    movie = Movie.new(details_data, credits_data, reviews_data)

  end
end
