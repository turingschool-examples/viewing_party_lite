class MovieDBService
  def self.top_rated_movies_page_1
    response = conn.get("/3/movie/top_rated?api_key=#{ENV["movie_api_key"]}&language=en-US&page=1")
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.top_rated_movies_page_2
    response = conn.get("/3/movie/top_rated?api_key=#{ENV["movie_api_key"]}&language=en-US&page=2")
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.find_movie(search)
    response = conn.get("/3/search/movie?api_key=#{ENV["movie_api_key"]}&language=en-US&query=#{search}")
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_movie(movie_id)
    response = conn.get("https://api.themoviedb.org/3/movie/#{movie_id}?api_key=#{ENV["movie_api_key"]}&language=en-US")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_cast(movie_id)
    response = conn.get("https://api.themoviedb.org/3/movie/#{movie_id}/credits?api_key=#{ENV["movie_api_key"]}&language=en-US")
    json = JSON.parse(response.body, symbolize_names: true)
    json[:cast]
  end

  def self.get_reviews(movie_id)
    response = conn.get("https://api.themoviedb.org/3/movie/#{movie_id}/reviews?api_key=#{ENV["movie_api_key"]}&language=en-US&page=1")
    json = JSON.parse(response.body, symbolize_names: true)
    json[:results]
  end

  private

  def self.conn
    Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.params['X-API-Key'] = ENV["movie_api_key"]
    end
  end
end
