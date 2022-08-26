class MovieService

  def self.conn
    Faraday.new("https://api.themoviedb.org")
  end

  def self.get_top_movies
    response1 = conn.get("/3/movie/top_rated?api_key=#{ENV['movie_api_key']}&page=1")
    response2 = conn.get("/3/movie/top_rated?api_key=#{ENV['movie_api_key']}&page=2")

    page1 = JSON.parse(response1.body, symbolize_names: true)
    page2 = JSON.parse(response2.body, symbolize_names: true)

    parsed_json = page1[:results] + page2[:results]
  end

  def self.search_movie(search)
    response1 = conn.get("/3/search/movie?api_key=#{ENV['movie_api_key']}&query=#{search}&page=1")
    response2 = conn.get("/3/search/movie?api_key=#{ENV['movie_api_key']}&query=#{search}&page=2")

    page1 = JSON.parse(response1.body, symbolize_names: true)
    page2 = JSON.parse(response2.body, symbolize_names: true)

    parsed_json = page1[:results] + page2[:results]
  end

  def self.movie_details(id)
    response = conn.get("/3/movie/#{id}?api_key=#{ENV['movie_api_key']}&append_to_response=reviews,credits")
    json = JSON.parse(response.body, symbolize_names: true)
  end
end
