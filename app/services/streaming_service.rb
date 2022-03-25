class StreamingService
  def self.conn
    Faraday.new(url: "https://streaming-availability.p.rapidapi.com/get/basic") do |faraday|
        faraday.params['rapidapi-key']= ENV['streaming_api_key']
        end
    end

  def self.link(imdb_id)
    response = conn.get("?imdb_id=#{imdb_id}&output_language=en&country=us")
    if response.body != "no records are found for the given id\n"
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end