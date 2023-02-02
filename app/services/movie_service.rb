class MovieService
  def self.top_rated_movies
    response = conn.get("movie/top_rated")
    parse_body(response)
  end

  def self.keyword_search(keyword)
    response = conn.get("search/movie?query=#{keyword}")
    parse_body(response)
  end

  def self.conn
    Faraday.new(
      url: 'https://api.themoviedb.org/3',
      headers: { 'Authorization' => "Bearer #{ENV['v4_key']}" }
    )
  end

  def self.parse_body(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end