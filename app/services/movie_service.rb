class MovieService

  def self.conn
    Faraday.new('http://api.themoviedb.org/3/') do |faraday|
      faraday.params["api_key"] = ENV['movie_api_key']
    end
  end

  def self.movie_query_results(query)
    if query == "top%20rated"
      endpoint = "movie/top_rated"
    else
      endpoint = "search/movie?query=#{query}"
    end
    response = conn.get(endpoint)
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_movie_from_id(id)
    response = conn.get("movie/#{id}")
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_movie_credits_from_id(id)
    response = conn.get("movie/#{id}/credits")
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_movie_reviews_from_id(id)
    response = conn.get("movie/#{id}/reviews")
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_movie_images_from_id(id)
    response = conn.get("movie/#{id}/images")
    json = JSON.parse(response.body, symbolize_names: true)
  end
end
