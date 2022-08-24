class MovieService

  def self.conn
    Faraday.new("https://api.themoviedb.org")
  end

  def self.get_top_movies
    response1 = conn.get("/3/movie/top_rated?api_key=#{ENV['movie_api_key']}&page=1")
    response2 = conn.get("/3/movie/top_rated?api_key=#{ENV['movie_api_key']}&page=2")

    page1 = JSON.parse(response1.body, symbolize_names: true)
    page2 = JSON.parse(response2.body, symbolize_names: true)

    parsed_json = page1[:results] + page2[:results]
  end

  # def self.search_movie
    
  # end
end