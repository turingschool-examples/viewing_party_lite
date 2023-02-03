class SubService < ServiceSuper
  def self.ping(id, path)
    response = conn.get(path) do |req|
      req.params = { api_key: ENV['tmdb_api_key'],
                     language: 'en' }
    end

    parse(response)
  end
end
