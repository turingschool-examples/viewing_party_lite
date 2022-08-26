class MovieService 
  def self.details(movie_id)
    response = conn.get("/3/movie/#{movie_id}")
    status_check(response)
  end

  def self.reviews(movie_id)
    response = conn.get("/3/movie/#{movie_id}/reviews")
    status_check(response)
  end

  def self.credits(movie_id)
    response = conn.get("/3/movie/#{movie_id}/credits")
    status_check(response)
  end

  def self.status_check(response)
    if response.status == 200
     JSON.parse(response.body, symbolize_names: true)
    else
      nil
    end
  end

  private

  def self.conn
    Faraday.new(url: 'https://api.themoviedb.org', params: {api_key: ENV["TMDB_API_KEY"]})
  end
end