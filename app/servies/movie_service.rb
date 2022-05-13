class MovieService

  def self.top_rated_endpoint
    conn = Faraday.new(url: "https://api.themoviedb.org") 
    response = conn.get("/3/movie/top_rated?api_key=#{ENV['movie_db_key']}")
    data = JSON.parse(response.body, symbolize_names: true)
    data[:results]
  end 

  def self.search_for_movies(keyword)
    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params[:query] = keyword
    end 
    response = conn.get("/3/search/movie?api_key=#{ENV['movie_db_key']}")
    data = JSON.parse(response.body, symbolize_names: true)
    data[:results]
  end 
end 