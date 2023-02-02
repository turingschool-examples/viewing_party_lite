class MovieService
  def self.conn
    Faraday.new(url: "https://api.themoviedb.org")
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.movie(id)
    response = MovieService.conn.get("/3/movie/#{id}?api_key=#{ENV['movie_api_key']}")
    MovieService.parse(response)
  end

  def self.top_rated
    response = MovieService.conn.get("/3/movie/top_rated?api_key=#{ENV['movie_api_key']}")
    MovieService.parse(response)
  end

  def self.image(poster_path)
    "https://image.tmdb.org/t/p/h100#{poster_path}"
  end

  def self.search(string)
    response = MovieService.conn.get("/3/search/movie?query=#{string}&api_key=#{ENV['movie_api_key']}")
    MovieService.parse(response)
  end
end
