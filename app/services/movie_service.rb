class MovieService
  def self.conn
    Faraday.new(url: 'https://api.themoviedb.org', params: { api_key: ENV['api_key'] })
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.discover_movie(movie_query)
    if movie_query == 'top rated'
      response = conn.get('/3/movie/top_rated')
    else
      response = conn.get('/3/search/movie', { query: movie_query, include_adult: false } )
    end
    parse_json(response)
  end

  def self.movie_details(movie_id)
    response = conn.get("/3/movie/#{movie_id}")
    (parse_json(response))
  end

  def self.actors(movie_id)
    response = conn.get("/3/movie/#{movie_id}/credits")
    parse_json(response)
  end

  def self.review_details(movie_id)
    response = conn.get("/3/movie/#{movie_id}/reviews")
    parse_json(response)
  end
end
