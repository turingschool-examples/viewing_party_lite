class MovieService

  def self.get_movies(title)
    response = conn.get("/3/search/movie?api_key=#{ENV["movies_api_key"]}&query=#{title}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.movie_by_id(id)
    response = conn.get("/3/movie/#{id}?api_key=#{ENV["movies_api_key"]}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.cast(movie_id)
    response = conn.get("3/movie/#{movie_id}/credits?api_key=#{ENV['movies_api_key']}&language=en-US?")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.reviews(movie_id)
    response = conn.get("3/movie/#{movie_id}/reviews?api_key=#{ENV['movies_api_key']}&language=en-US&page=1")
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def self.conn
    Faraday.new(url: "https://api.themoviedb.org") 
  end
end
