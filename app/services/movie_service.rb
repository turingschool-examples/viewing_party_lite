require "pry"

class MovieService
  def self.get_top_movies
    response1 = conn.get("/3/movie/top_rated?api_key=#{api_key}")
    response2 = conn.get("/3/movie/top_rated?api_key=#{api_key}&page=2")
    parsed1 = JSON.parse(response1.body, symbolize_names: true)
    parsed2 = JSON.parse(response2.body, symbolize_names: true)
    parsed1[:results] + parsed2[:results]
  end

  def self.conn
    Faraday.new(url: "https://api.themoviedb.org")
  end

  def self.api_key
    ENV["movie_api_key"]
  end

  def self.get_search(params)
    response1 = conn.get("/3/search/movie?api_key=#{api_key}&query=#{params}")
    response2 = conn.get("/3/search/movie?api_key=#{api_key}&query=#{params}&page=2")
    parsed1 = JSON.parse(response1.body, symbolize_names: true)
    parsed2 = JSON.parse(response2.body, symbolize_names: true)
    parsed1[:results] + parsed2[:results]
  end

  def self.get_movie(id)
    response = conn.get("/3/movie/#{id}?api_key=#{api_key}")

    parsed = JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_cast(id)
    response = conn.get("/3/movie/#{id}/credits?api_key=#{api_key}")

    parsed = JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_reviews(id)
    response = conn.get("/3/movie/#{id}/reviews?api_key=#{api_key}")

    parsed = JSON.parse(response.body, symbolize_names: true)
  end
end
