class MovieService

  def self.conn
    Faraday.new(url:'https://api.themoviedb.org') do |faraday|
      faraday.params["api_key"] = ENV["movie_key"]
    end
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.popular_movies 
    page1 = conn.get('/3/movie/popular')
    page2 = conn.get('/3/movie/popular?page=2')
    parse_json(page1)[:results] + parse_json(page2)[:results]
  end

  def self.find_movies(search)
    page1 = conn.get("/3/search/movie?query=#{search}")
    page2 = conn.get("/3/search/movie?query=#{search}&page=2")
    parse_json(page1)[:results] + parse_json(page2)[:results]
  end
end

# cast  
# reviews 
# movie details 
