class MovieService

  def self.get_movies(title)
    response = conn.get("/3/search/movie?api_key=#{ENV["movies_api_key"]}&query=#{title}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.movie_by_id(id)
    response = conn.get("/3/search/movie/#{id}?api_key=#{ENV["movies_api_key"]}")
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def self.conn
    Faraday.new(url: "https://api.themoviedb.org") 
  end
end
