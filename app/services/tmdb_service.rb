require 'pry'

class TmdbService
  def self.conn
    Faraday.new(url: 'https://api.themoviedb.org') do |f| 
      f.params['api_key'] = ENV['tmdb_key']
    end
  end

  def self.top_rated_movies(page_number)
    response = conn.get("/3/movie/top_rated?&page=#{page_number}")
    
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.keyword(search_term, page_number = 1)
    response = conn.get("/3/search/movie?&query=#{search_term}&page=#{page_number}")

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.reviews(movie_id)
    response = conn.get("/3/movie/#{movie_id}/reviews")
    
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.details(movie_id)
    response = conn.get("https://api.themoviedb.org/3/movie/#{movie_id}")

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.credits(movie_id)
    response = conn.get("https://api.themoviedb.org/3/movie/#{movie_id}/credits")

    JSON.parse(response.body, symbolize_names: true)
  end
end
