class MovieService
    def self.connect
            Faraday.new(url: "https://www.themoviedb.org") do |faraday|
            faraday.params["api_key"] = ENV['moviedb_api_key']
        end
    end 

    def self.search_movies(movie_search)
        response = connect.get("/3/search/movie?query=#{movie_search}")
        json = JSON.parse(response.body, symbolize_names: true)
    end 

end 