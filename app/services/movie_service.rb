require 'json'
class MovieService

  def self.conn
    Faraday.new('https://api.themoviedb.org/3/') do |faraday|
      faraday.params["api_key"] = ENV['movie_key']
    end
  end
end