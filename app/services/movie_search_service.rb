class MovieSearchService

  def self.search(query)
    JSON.parse(conn(query).get.body, symbolize_names: true)
  end


  private

  def self.conn(query)
    Faraday.new(
      url: "https://api.themoviedb.org/3/search/movie?query=#{query}",
      params: {api_key: ENV['MOVIE_DB_KEY'] }
    )
  end
end