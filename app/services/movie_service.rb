class MovieService
  def self.connect
    Faraday.new(
      url: 'https://api.themoviedb.org',
      params: {api_key: ENV["movies_api_key"]})
  end

  def self.get_movie(api_id)
    response = MovieService.connect.get("/3/movie/#{api_id}")
    attrs = JSON.parse(response.body, symbolize_names: true)
    MovieCall.new(attrs)
  end
end
