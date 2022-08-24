class TmdbService

   def get_url
      Faraday.new("https://api.themoviedb.org") do |faraday|
        faraday.params["api_key"] = ENV['api_key']
      end
    end

end
