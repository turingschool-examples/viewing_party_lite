class MovieService 
  def self.conn
    Faraday.new("https://api.themoviedb.org")
  end

  def self.get_top_rated
    response1 = conn.get("/3/movie/top_rated?api_key=#{ENV['movie_api_key']}&page=1")
    response2 = conn.get("/3/movie/top_rated?api_key=#{ENV['movie_api_key']}&page=2")

    parsed_json1 = JSON.parse(response1.body, symbolize_names: true)
    parsed_json2 = JSON.parse(response2.body, symbolize_names: true)
    parsed_json1[:results] + parsed_json2[:results] 
  end
  
  def self.get_movie_search(search_param)
    response = conn.get("/3/search/movie?&api_key=#{ENV['movie_api_key']}&language=en-US&page=1&query=#{search_param}")
    parsed_json = JSON.parse(response.body, symbolize_names: true)
    parsed_json[:results]
  end

  def self.get_spec_movie(movie_id)
    response = conn.get("/3/movie/#{movie_id}?api_key=#{ENV['movie_api_key']}&language=en-US")
    parsed_json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_cast(movie_id)
    response = conn.get("/3/movie/#{movie_id}/credits?api_key=#{ENV['movie_api_key']}&language=en-US&cast=1")
    parsed_json = JSON.parse(response.body, symbolize_names: true)
  end
 
  def self.get_reviews(movie_id)
    response = conn.get("/3/movie/#{movie_id}/reviews?api_key=#{ENV['movie_api_key']}")
    parsed_json = JSON.parse(response.body, symbolize_names: true)
  end
end