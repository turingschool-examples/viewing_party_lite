class MovieService
  def self.conn
    Faraday.new("https://api.themoviedb.org") do |faraday|
      faraday.params['api_key'] = ENV['movie_api_key']
    end
  end

  def self.format_return(results)
    results.map do |movie|
      Movie.new(movie)
    end
  end

  def self.top_movies
    response_page_one = conn.get("/3/movie/top_rated?api_key=#{ENV['movie_api_key']}")
    response_page_two = conn.get("/3/movie/top_rated?page=2&api_key=#{ENV['movie_api_key']}")
    data_page_one = JSON.parse(response_page_one.body, symbolize_names: true)
    data_page_two = JSON.parse(response_page_two.body, symbolize_names: true)
    a = data_page_one[:results]
    b = data_page_two[:results]
    results = (a << b).flatten

    format_return(results)
  end

  def self.search_for_movie(search_name)
    response = conn.get("/3/search/movie?query=#{search_name}&api_key=#{ENV['movie_api_key']}")
    data = JSON.parse(response.body, symbolize_names: true)
    results = data[:results]

    format_return(results)
  end

  def self.movie_info(movie_id)
    response = conn.get("/3/movie/#{movie_id}?api_key=#{ENV['movie_api_key']}&language=en-US")
    data = JSON.parse(response.body, symbolize_names: true)

    Movie.new(data)
  end

  def self.reviews(movie_id)
    response = conn.get("/3/movie/#{movie_id}/reviews?api_key=#{ENV['movie_api_key']}&language=en-US")
    data = JSON.parse(response.body, symbolize_names: true)
    results = data[:results]

    results.map do |data|
      Review.new(data)
    end
  end
end
