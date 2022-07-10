class MovieService
  
  def self.conn
    Faraday.new("https://api.themoviedb.org")
  end

  def self.api_key
    ENV["movies_api_key"]
  end

  def self.get_top_movies
    response1 = conn.get("/3/movie/top_rated?api_key=#{api_key}&page=1")
    response2 = conn.get("/3/movie/top_rated?api_key=#{api_key}&page=2")
    
    parsed1 = JSON.parse(response1.body, symbolize_names: true)
    parsed2 = JSON.parse(response2.body, symbolize_names: true)

    parsed1[:results] + parsed2[:results]
  end

  def self.get_search_movie(keyword)
    response = conn.get("/3/search/movie?query=#{keyword}&api_key=#{api_key}")
    JSON.parse(response.body, symbolize_names: true)[:results]
  end
end
