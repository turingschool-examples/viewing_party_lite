class MovieService
  def self.conn
    Faraday.new("https://api.themoviedb.org")
  end

  def self.movie_titles_by_rating
    response = conn.get("/3/movie/popular") do |faraday|
      faraday.params["api_key"] = ENV["tmdb_api_key"]
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.movie_by_keyword(query)
    response = conn.get("/3/search/movie?query=#{query}") do |faraday|
      faraday.params["api_key"] = ENV["tmdb_api_key"]
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.movie_cast_info(movie_id)
    response = conn.get("/3/movie/#{movie_id}/credits?") do |faraday|
      faraday.params["api_key"] = ENV["tmdb_api_key"]
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.movie_details
    response = conn.get("/3/movie/#{movie_id}?") do |faraday|
      faraday.params["api_key"] = ENV["tmdb_api_key"]
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.movie_reviews
    response = conn.get("/3/movie/#{movie_id}/reviews?") do |faraday|
      faraday.params["api_key"] = ENV["tmdb_api_key"]
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.movie_picture
    response = conn.get("/3/movie/#{movie_id}/images?") do |faraday|
      faraday.params["api_key"] = ENV["tmdb_api_key"]
    end

    JSON.parse(response.body, symbolize_names: true)
  end
end
