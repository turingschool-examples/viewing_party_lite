class TmdbService
  def top_rated
    get_url("/3/movie/top_rated")
  end

  def search_movies(query)
    get_url("/3/search/movie", { query: "#{query}", page: 1, include_adult: false })
  end

  def get_movie(movie_id)
    get_url("/3/movie/#{movie_id}")
  end

  def get_credits(movie_id)
    get_url("/3/movie/#{movie_id}/credits")
  end

  def get_reviews(movie_id)
    get_url("/3/movie/#{movie_id}/reviews")
  end

  def get_url(url, params = nil)
    response = conn.get(url, params)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params['api_key'] = ENV['tmdb_api_key']
      faraday.params['language'] = 'en-US'
    end
  end
end
