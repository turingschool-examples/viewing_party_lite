class MovieService
  def self.top_rated_movies
    response = conn.get("/3/movie/top_rated")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.movie_keywords(keyword)
    response = conn.get("/3/search/movie?query=#{keyword}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.find_movie(id)
    response = conn.get("/3/movie/#{id}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.find_cast(id)
    response = conn.get("/3/movie/#{id}/credits")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.find_reviews(id)
    response = conn.get("/3/movie/#{id}/reviews")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params["api_key"] = ENV['movie_api_key']
    end
  end
end
