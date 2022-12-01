# frozen_string_literal: true

class MovieService
  def top_rated_movies
    get_url('/3/movie/top_rated')
  end

  def search(keyword)
    get_url("/3/search/movie?query=#{keyword}")
  end

  def find_by_id(id)
    get_url("/3/movie/#{id}")
  end

  def find_movie_cast(id)
    get_url("/3/movie/#{id}/credits")
  end

  def find_movie_reviews(id)
    get_url("/3/movie/#{id}/reviews")
  end

  def get_url(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://api.themoviedb.org') do |f|
      f.params['api_key'] = ENV['da_key']
      f.params['language'] = 'en'
      f.adapter Faraday.default_adapter
    end
  end
end
