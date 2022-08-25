class MovieDBService
  def self.top_rated_movies_page_1
    conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.params['X-API-Key'] = ENV["movie_api_key"]
      faraday.adapter Faraday.default_adapter
    end
    response = conn.get("/3/movie/top_rated?api_key=#{ENV["movie_api_key"]}&language=en-US&page=1")
    json = JSON.parse(response.body, symbolize_names: true)
  end 

  def self.top_rated_movies_page_2
    conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.params['X-API-Key'] = ENV["movie_api_key"]
      faraday.adapter Faraday.default_adapter
    end
    response = conn.get("/3/movie/top_rated?api_key=#{ENV["movie_api_key"]}&language=en-US&page=2")
    json = JSON.parse(response.body, symbolize_names: true)
  end 
end


