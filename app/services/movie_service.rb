require 'json'

class MovieService
  def initialize
    @conn = Faraday.new('https://api.themoviedb.org/3/movie/')
  end

  def top_rated
    @conn.get(
      url: '/top_rated',
      params: {api_key: ENV['moviebd_api_key']}
    )
  end
end