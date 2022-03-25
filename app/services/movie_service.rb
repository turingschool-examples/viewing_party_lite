class MovieService

  def self.get_top_rated_movies
    get_url("/3/movie/top_rated?api_key=#{ENV['api_key']}")
  end

  def self.get_movie_reviews(movie_id)
    get_url("/3/movie/#{movie_id}/reviews?api_key=#{ENV['api_key']}")
  end

  def self.get_movie_details(movie_id)
    get_url("/3/movie/#{movie_id}?api_key=#{ENV['api_key']}")
  end

  def self.get_movie_credits(movie_id)
    get_url("/3/movie/#{movie_id}/credits?api_key=#{ENV['api_key']}")
  end


  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: "https://api.themoviedb.org")
  end

end
