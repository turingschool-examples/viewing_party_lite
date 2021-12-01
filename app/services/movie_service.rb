class MovieService
  def self.top_40
    content = conn.get("/3/movie/top_rated?api_key=#{ENV['movie_api_key']}")
    content2 = conn.get("/3/movie/top_rated?page=2&api_key=#{ENV['movie_api_key']}")
    results = (parse_response(content))[:results]
    results2 = (parse_response(content2))[:results]

    (results << results2).flatten!

    results.map do |movie|
      Movie.new(movie)
    end
  end

  def self.movie_details(movie_id)
    content = conn.get("/3/movie/#{movie_id}?api_key=#{ENV['movie_api_key']}")
    results = parse_response(content)
    Movie.new(results)
  end

  def self.get_reviews
    content = conn.get("/3/movie/#{movie_id}/reviews?api_key=#{ENV['movie_api_key']}")
    results = parse_response(content)
    Movie.new(results)
  end

  def self.get_cast

  end

  def self.find(movie)
    content = conn.get("/3/search/movie?query=#{movie}&api_key=#{ENV['movie_api_key']}")
    content2 = conn.get("/3/search/movie?query=#{movie}&page=2&api_key=#{ENV['movie_api_key']}")
    results = (parse_response(content))[:results]
    results2 = (parse_response(content2))[:results]

    (results << results2).flatten!

    results.map do |movie|
      Movie.new(movie)
    end
  end

  def self.parse_response(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: "https://api.themoviedb.org")
  end
end
