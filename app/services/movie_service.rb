class MovieService
  class << self
    def conn
      conn = Faraday.new(url: 'https://api.themoviedb.org/3/') do |f|
        f.params['api_key'] = ENV['movie_api_key']
      end
    end

    def get_data(url)
      response = conn.get(url)

      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
