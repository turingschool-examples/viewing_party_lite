class MovieService

  def self.top_rated_movies
    conn = Faraday.new(url: "https://api.themoviedb.org/3/movie/top_rated") do |faraday|
      faraday.params["api_key"] = ENV['api_key']
    end
    response = conn.get
    data = JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_movie_details(movie_id)
    conn = Faraday.new(url: "https://api.themoviedb.org/3/movie/#{movie_id}") do |faraday|
      faraday.params["api_key"] = ENV['api_key']
    end
    response = conn.get
    data = JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_movie_reviews(movie_id)
    conn = Faraday.new(url: "https://api.themoviedb.org/3/movie/#{movie_id}/reviews") do |faraday|
      faraday.params["api_key"] = ENV['api_key']
    end
    response = conn.get
    data = JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_movie_credits(movie_id)
    conn = Faraday.new(url: "https://api.themoviedb.org/3/movie/#{movie_id}/credits") do |faraday|
      faraday.params["api_key"] = ENV['api_key']
    end
    response = conn.get
    data = JSON.parse(response.body, symbolize_names: true)
  end
end
