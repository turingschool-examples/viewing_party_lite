
class MoviesService
  def self.get_top_rated_movies(top_rated)
    end_point = '/3/movie/top_rated'
    response = connection.get(end_point) do |faraday|
      faraday.params['api_key'] = ENV['movies_db_api_key']
      faraday.params['language'] = 'en-US'
    end
    JSON.parse(response.body, symbolize_names: true)

  end

  def self.connection
    url = 'https://api.themoviedb.org'
    Faraday.new(url: url)
  end
end
