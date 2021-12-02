class MovieService
  class << self
    def call_api(path)
      response = connection.get(path)
      parsed_data(response)
    end

    private
    def connection
      Faraday.new("https://api.themoviedb.org")
    end

    def parsed_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
