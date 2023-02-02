class SubService < ServiceSuper
  def self.ping(id, path)
    cast_response = conn.get(path) do |req|
      req.params = { api_key: ENV['tmdb_api_key'],
                     language: 'en' }
    end

    parse(cast_response)
  end
end
