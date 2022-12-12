# frozen_string_literal: true

class MovieService
  def self.top_rated_movies
    get_url('/3/movie/top_rated')
  end

  def self.search(keyword)
    get_url("/3/search/movie?query=#{keyword}")
  end

  def self.find_by_id(id)
    get_url("/3/movie/#{id}")
  end

  def self.find_movie_cast(id)
    get_url("/3/movie/#{id}/credits")
  end

  def self.find_movie_reviews(id)
    get_url("/3/movie/#{id}/reviews")
  end

  def self.get_url(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://api.themoviedb.org') do |f|
      f.params['api_key'] = ENV['da_key']
      f.params['language'] = 'en'
      f.adapter Faraday.default_adapter
    end
  end
end
