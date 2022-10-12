class MovieDbService
    def self.top_rated_movies 
        conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
            faraday.params["api_key"] = ENV['themoviedb_key']
          end
          response = conn.get("3/movie/top_rated")
      
          data = JSON.parse(response.body, symbolize_names: true)
    end

    def self.movies_search(keyword)
        conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
            faraday.params["api_key"] = ENV['themoviedb_key']
            faraday.params["query"] = keyword
          end
          response = conn.get("3/search/movie")
      
          data = JSON.parse(response.body, symbolize_names: true)
    end
end