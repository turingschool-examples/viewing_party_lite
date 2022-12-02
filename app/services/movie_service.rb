class MovieService

  # def self.conn
  #   Faraday.new(url: 'https://api.themoviedb.org/3') do |faraday|
  #     faraday.headers['api_key'] = ENV['movies_api_key']
  #   end
  # end

  def self.top_rated_movies
     conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.params['api_key'] = ENV['movies_api_key']
     end  
    response = conn.get('/3/movie/top_rated')
    data = JSON.parse(response.body, symbolize_names: true)
    top_rated_movies = data[:results]
  end

  def self.movie_search(title)

  end
end