class MovieService
  def self.conn 
    Faraday.new("https://api.themoviedb.org")
  end

  def self.get_top_rated
    response ||= conn.get("/3/movie/top_rated?api_key=#{ENV['movie_api_key']}&page=1") #gets top 20 movies
    parse_json = JSON.parse(response.body, symbolize_names: true)[:results]
  end
  # def self.get_cast

  # end
end