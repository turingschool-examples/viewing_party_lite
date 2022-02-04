class MovieService
  def self.conn
    Faraday.new("https://api.themoviedb.org") do |faraday|
      faraday.params['api_key'] = ENV['movie_api_key']
    end
  end

  def self.top_movies
    response_page_one = conn.get("/3/movie/top_rated?api_key=#{ENV['movie_api_key']}")
    response_page_two = conn.get("/3/movie/top_rated?page=2&api_key=#{ENV['movie_api_key']}")
    data_page_one = JSON.parse(response_page_one.body, symbolize_names: true)
    data_page_two = JSON.parse(response_page_two.body, symbolize_names: true)
    a = data_page_one[:results]
    b = data_page_two[:results]
    (a << b).flatten
  end

  def self.search_for_movie(search_name)
    response = conn.get("/3/search/movie?query=#{search_name}&api_key=#{ENV['movie_api_key']}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.movie_info(movie_id)
    response = conn.get("/3/movie/#{movie_id}?api_key=#{ENV['movie_api_key']}&language=en-US")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.reviews(movie_id)
    response = conn.get("/3/movie/#{movie_id}/reviews?api_key=#{ENV['movie_api_key']}&language=en-US")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.cast(movie_id)
    response = conn.get("/3/movie/#{movie_id}/credits?api_key=#{ENV['movie_api_key']}&language=en-US")
    JSON.parse(response.body, symbolize_names: true)
  end
end
