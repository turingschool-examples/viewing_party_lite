class MovieService < BaseService
  def self.top_rated_movies
    response = conn.get("/3/movie/top_rated?api_key=#{ENV['movie_api_key']}&language=en-US&page=1")

    get_json(response)
  end

  def self.search(keywords)
    response = conn.get("/3/search/movie?api_key=#{ENV['movie_api_key']}&language=en-US&query=#{keywords}&page=1&include_adult=false")

    get_json(response)
  end

  def self.movie_details(movie_id)
    response = conn.get("/3/movie/#{movie_id}?api_key=#{ENV['movie_api_key']}")

    get_json(response)
  end

  def self.reviews(movie_id)
    response = conn.get("/3/movie/#{movie_id}/reviews?api_key=#{ENV['movie_api_key']}")

    get_json(response)
  end

  def self.cast_members(movie_id)
    response = conn.get("/3/movie/#{movie_id}/credits?api_key=#{ENV['movie_api_key']}")

    get_json(response)
  end
end
