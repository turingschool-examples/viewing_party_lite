class StreamingService
  def self.conn
    Faraday.new(url: "https://streaming-availability.p.rapidapi.com/get/basic") do |faraday|
        faraday.params['rapidapi-key']= ENV['streaming_api_key']
        end
    end

  def self.netflix(movie_id)
    imdb_id = MovieFacade.new(movie_id).movie
    response = conn.get("?imdb_id=#{imdb_id}&output_language=en&country=us")
    json = JSON.parse(response.body, symbolize_names: true)
  end
end