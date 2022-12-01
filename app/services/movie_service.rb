# frozen_string_literal: true

class MovieService
  def self.posters_en_us(movie)
    movie_id = movie.movie_id
    response = conn.get("/3/movie/#{movie_id}")
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.top_rated_movies
    response = conn.get('/3/movie/top_rated')

    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.search(keyword)
    response = conn.get("/3/search/movie?query=#{keyword}")

    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.find_by_id(id)
    response = conn.get("/3/movie/#{id}")

    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.find_movie_cast(id)
    response = conn.get("/3/movie/#{id}/credits")

    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.find_movie_reviews(id)
    response = conn.get("/3/movie/#{id}/reviews")

    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://api.themoviedb.org') do |f|
      f.params['api_key'] = ENV['da_key']
      f.params['language'] = 'en'
      f.adapter Faraday.default_adapter
    end
  end
end
