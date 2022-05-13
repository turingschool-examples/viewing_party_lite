class ApplicationService
  def conn
    Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params['api_key'] = ENV['tmdb_key']
    end
  end

  def parse_json(response)
    JSON.parse(response, symbolize_names: true)
  end
end
