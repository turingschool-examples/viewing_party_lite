class MovieService
  def self.conn
    Faraday.new(url: 'https://api.themoviedb.org/',
                params: { api_key: ENV['api_key'],
                          language: 'en-US' }
               )
  end

  def self.get_top_rated
    response = conn.get('/3/movie/top_rated?page=1')
    parse_json(response)
  end

  def self.search(keyword)
    response = conn.get("/3/search/movie?page=1&include_adult=false&query=#{keyword}")
    parse_json(response)
  end

  def self.get_cast(movie_id)
    response = conn.get("/3/movie/#{movie_id}/credits")
    parse_json(response)
  end

  def self.get_details(movie_id)
    response = conn.get("/3/movie/#{movie_id}")
    parse_json(response)
  end

  def self.get_reviews(movie_id)
    response = conn.get("/3/movie/#{movie_id}/reviews")
    parse_json(response)
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end