class MovieService < ServiceSuper
  def self.ping(path, params)
    response = conn.get(path) do |req|
      req.params = params
    end

    parse(response)
  end
end
