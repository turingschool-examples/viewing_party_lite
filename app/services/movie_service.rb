class MovieService

  def self.movie_by_id(search_id)
    response = conn.get("movie/#{search_id}")
    parse(response)
  end

  def self.top_rated_movies
    response = conn.get("movie/top_rated")
    parse(response)
  end

  def self.movie_search(movie_term)
    response = conn.get("search/movie?query=#{movie_term}")
    parse(response)
  end

  def self.movie_cast(movie_id)
    response = conn.get("movie/#{movie_id}/credits")
    parse(response)
  end

  def self.movie_reviews(movie_id)
    response = conn.get("movie/#{movie_id}/reviews")
    parse(response)
  end


  private

  def self.conn
    Faraday.new('https://api.themoviedb.org/3/') do |faraday|
      faraday.params["api_key"] = ENV['movie_key']
    end
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
