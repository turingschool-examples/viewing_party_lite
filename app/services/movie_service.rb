class MovieService
  def self.connection
    Faraday.new(url: 'https://api.themoviedb.org/3')
  end

  def self.parse_response(uri)
    JSON.parse(response(uri).body, symbolize_names: true)
  end

  def self.response(uri)
    connection.get(uri)
  end
end
