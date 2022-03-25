class MovieService
  def self.conn
    Faraday.new(url: 'https://api.themoviedb.org')
  end

  def self.api_key
    ENV['movie_api_key']
  end

  def self.get_top_movie
    response_1 = conn.get("3/movie/top_rated?api_key=#{api_key}")
    response_2 = conn.get("3/movie/top_rated?api_key=#{api_key}&page=2")
    parsed_1 = JSON.parse(response_1.body, symbolize_names: true)
    parsed_2 = JSON.parse(response_2.body, symbolize_names: true)
    results = parsed_1[:results] + parsed_2[:results]
  end

  def self.get_search_movie(params)
    response_1 = conn.get("3/search/movie?api_key=#{api_key}&query=#{params}")
    response_2 = conn.get("3/search/movie?api_key=#{api_key}&query=#{params}&page=2")
    parsed_1 = JSON.parse(response_1.body, symbolize_names: true)
    parsed_2 = JSON.parse(response_2.body, symbolize_names: true)
    results = parsed_1[:results] + parsed_2[:results]
  end

  def self.get_movie_details(movie_id)
    response_1 = conn.get("3/movie/#{movie_id}?api_key=#{api_key}")
    parsed_1 = JSON.parse(response_1.body, symbolize_names: true)
  end

  def self.get_cast(movie_id)
    response_1 = conn.get("3/movie/#{movie_id}/credits?api_key=#{api_key}")
    parsed_1 = JSON.parse(response_1.body, symbolize_names: true)
  end

  def self.get_reviews(movie_id)
    response_1 = conn.get("3/movie/#{movie_id}/reviews?api_key=#{api_key}")
    parsed_1 = JSON.parse(response_1.body, symbolize_names: true)
  end
end
