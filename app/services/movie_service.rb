class MovieService
  def self.search(keywords)
    get_url("search/movie?query=#{keywords}")
  end

  def self.top_rated
    get_url("movie/top_rated")
  end

  def self.get_url(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end

  def self.conn
    conn = Faraday.new(url: 'https://api.themoviedb.org/3/') do |faraday|
      faraday.params["api_key"] = ENV["movie_api_key"]
    end
  end
end