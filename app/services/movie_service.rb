class MovieService
  class << self
    def top_rated
      call_api("/3/movie/top_rated?api_key=#{ENV['api_key']}")
    end

  private

    def call_api(path)
      response = conn.get(path)
      parsed_data(response)
    end

    def conn
      conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
        faraday.headers['api_key'] = ENV['api_key']
      end
    end

    def parsed_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
