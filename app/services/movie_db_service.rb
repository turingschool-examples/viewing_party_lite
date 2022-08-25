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

  private

  def self.conn 
    Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.params['X-API-Key'] = ENV["movie_api_key"]
    end
  end
end


