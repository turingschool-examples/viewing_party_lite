class MovieService 
  def self.conn
    Faraday.new("https://api.themoviedb.org")
  end

  def self.get_top_rated
    response1 = conn.get("/3/movie/top_rated?api_key=#{ENV['movie_api_key']}&page=1")
    response2 = conn.get("/3/movie/top_rated?api_key=#{ENV['movie_api_key']}&page=2")

    parsed_json1 = JSON.parse(response1.body, symbolize_names: true)
    parsed_json2 = JSON.parse(response2.body, symbolize_names: true)
    # require 'pry'; binding.pry 
    parsed_json1[:results] + parsed_json2[:results] 
  end
end