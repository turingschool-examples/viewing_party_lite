class MovieService

  def self.top_rated_movies(uri)
    response = connection.get(uri)
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.find_movie(id)
    response = connection.get("/3/movie/#{id}")
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.connection
    Faraday.new(url: 'https://api.themoviedb.org') do |f|
      f.params['api_key'] = ENV['tmdb_api_key']
    end
  end
end