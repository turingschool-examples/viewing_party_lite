class ServiceSuper
  def self.conn
    Faraday.new(url: 'https://api.themoviedb.org')
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
